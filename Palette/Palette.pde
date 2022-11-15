/*
 * Palette Graphique - prélude au projet multimodal 3A SRI
 * 4 objets gérés : cercle, rectangle(carré), losange et triangle
 * (c) 05/11/2019
 * Dernière révision : 28/04/2020
 */
 
import java.awt.Point;
import fr.dgac.ivy.*;
import processing.sound.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer player;

Ivy bus_receiver; // pour recevoir le message ivy
Ivy bus_receiver2; // pour recevoir les gestes 

Click avant_dernier; // sauvegarder l'avant dernier click et la forme associee 
Click dernier; // sauvegarder la position du dernier click plus la forme associée 
int timer;

ArrayList<Forme> formes; // liste de formes stockées
FSM mae; // Finite Sate Machine
int indice_forme;
PImage sketch_icon;
String message= "";
String last_forme;


void setup() {
  last_forme = "banane";
  timer = 0;
  size(800,600);
  surface.setResizable(true);
  surface.setTitle("Palette multimodale");
  surface.setLocation(20,20);
  sketch_icon = loadImage("Palette.jpg");
  surface.setIcon(sketch_icon);
  
  minim = new Minim(this);
  player = minim.loadFile("MFJA.mp3");
  
  
  formes= new ArrayList(); // nous créons une liste vide
  noStroke();
  mae = FSM.INITIAL;
  indice_forme = -1;
  
  try
  {
    bus_receiver = new Ivy("demo", " demo_processing is ready", null);
    bus_receiver.start("127.255.255.255:2010");
    bus_receiver.bindMsg("^sra5 Parsed=action=(.*) forme=(.*) couleur=(.*) lieu=(.*) Confidence=(.*) NP=(.*) Num_A=(.*)", new IvyMessageListener()
    {
      public void receive(IvyClient client,String[] args)
      {
        
        try
        {
          bus_receiver.sendMsg("recu commande vocale Feedback=ok");
          command_received(args[0],args[1],args[2],args[3]);
        }
        
        catch (IvyException ie) {}  
      }        
    });
    bus_receiver.bindMsg("^OneDollarIvy Template=(.*) Confidence=(.*)", new IvyMessageListener()
    {
      public void receive(IvyClient client,String[] args)
      {
        
        try
        {
          bus_receiver.sendMsg("recu commande gestuelle Feedback=ok");
          geste_received(args[0],args[1]);
        }
        
        catch (IvyException ie) {}  
      }        
    });
    
  
  }
  catch (IvyException ie)
  {
  }
}

void draw() {
  background(0);
  
  if(last_forme!=null){
    fill(255,0,0);
    text(last_forme,10,50);
  }
  
  
  
  println("MAE : " + mae + " indice forme active ; " + indice_forme);
  switch (mae) {
    case INITIAL:  // Etat INITIAL
      background(255);
      fill(250,0,0);
      text("INIT",10,10);
      mae = FSM.AFFICHER_FORMES;
      break;
      
    case AFFICHER_FORMES:  // 
      affiche();
      break;   
    case ATTENTE_PAROLE:
      affiche();
      timer+=1;
      fill(255,0,0);
      text(timer,10,10);

      if(timer > 300){
        timer = 0;
        mae = FSM.AFFICHER_FORMES;
        clean();
      }
      break;
    case ATTENTE_CLIC:
      affiche();
      timer+=1;
      fill(255,0,0);
      text(timer,10,10);

      if(timer > 200){
        timer = 0;
        mae = FSM.AFFICHER_FORMES;
        clean();
      }
      break;
    case ATTENTE_GESTE:
      affiche();
      timer+=1;
      fill(255,0,0);
      text(timer,10,10);

      if(timer > 300){
        timer = 0;
        mae = FSM.AFFICHER_FORMES;
        clean();
      }
      break;
    default:
      break;
  }  
}

// fonction d'affichage des formes m
void affiche() {
  background(255);
  /* afficher tous les objets */
  for (int i=0;i<formes.size();i++) // on affiche les objets de la liste
    (formes.get(i)).update();
}

void mousePressed() { // sur l'événement clic
  Point p = new Point(mouseX,mouseY);
  avant_dernier = dernier;
  Forme derniere_forme;
  derniere_forme = null;
  
  for (int i=0;i<formes.size();i++) { // we're trying every object in the list
    // println((formes.get(i)).isClicked(p));
    if ((formes.get(i)).isClicked(p)) {
      derniere_forme = formes.get(i);
    }
  }
  dernier = new Click(p,derniere_forme);
  
  
  switch (mae) {
    case AFFICHER_FORMES:
      mae = FSM.ATTENTE_PAROLE;
      break;
    case ATTENTE_CLIC:
      Forme f = new Losange(dernier);
      if(last_forme != null){
        switch(last_forme){
          case "triangle" :
            f = new Triangle(dernier);
            break;
          case "carre" :
            f = new Rectangle(dernier);
            break;
          case "cercle" :
            f = new Cercle(dernier);
            break;
          case "MFJAAAAAAA":
            f = new Mfja(dernier);
            break;
          default:
            break;
        }
      }
      
      formes.add(f);
      break;
    default:
      break;
  }
  
  if (dernier.is_linked()){ // si le dernier click est lié à une forme
   //dernier.get_forme().setLocation(new Point(10,height-10));
  }
  if(avant_dernier != null){
    if (avant_dernier.is_linked()){
      //avant_dernier.get_forme().setLocation(new Point(10,10));
    }
  }
}


void keyPressed() {
  Point p = new Point(mouseX,mouseY);
  switch(key) {
    case 'r':
      Forme f= new Rectangle(p);
      formes.add(f);
      mae=FSM.AFFICHER_FORMES;
      break;
      
    case 'c':
      Forme f2=new Mfja(p);
      formes.add(f2);
      mae=FSM.AFFICHER_FORMES;
      break;
    
    case 't':
      Forme f3=new Triangle(p);
      formes.add(f3);
       mae=FSM.AFFICHER_FORMES;
      break;  
      
    case 'l':
      Forme f4=new Losange(p);
      formes.add(f4);
      mae=FSM.AFFICHER_FORMES;
      break;    
      
  }
}
