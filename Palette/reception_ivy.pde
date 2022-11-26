void command_received(String action, String forme, String couleur, String lieu){
  
  switch(action){
    case "CREER":
      if(dernier != null){
        Forme f = null;
        Click position = dernier;
        if(couleur == "INVERSE"){
          position = avant_dernier;
        }
        switch (forme){
          case "CARRE":
            f = new Rectangle(position, couleur);
            break;
          
          case "LOSANGE":
            f = new Losange(position, couleur);
            break;
          
          case "CERCLE":
            f = new Cercle(position, couleur);
            break;
          
          case "TRIANGLE":
            f = new Triangle(position, couleur);
            break;
            
          case "JACQUELINE":
            player.rewind();
            f = new Mfja(dernier, couleur);
            player.play();
          break;
        }
        if(f != null){
          formes.add(f);
          mae=FSM.AFFICHER_FORMES;
          clean();
        }
      }
      break;
      
    case "DEPLACER":
      if(dernier != null && avant_dernier != null){
        if(avant_dernier.get_forme() != null){
          avant_dernier.get_forme().setLocation(dernier);
        }
        mae=FSM.AFFICHER_FORMES;
        clean();
      }
      break;
      
    case "SUPPRIMER":
      if(dernier != null){
        formes.remove(dernier.get_forme());
      }
      mae=FSM.AFFICHER_FORMES;
      clean();
      break;

    case "COULEUR":
      if(dernier != null){
        if(dernier.is_linked()){
          switch(couleur){
            case "ROUGE" : dernier.get_forme().setColor(color(255, 0, 0)); break;
            case "VERT" : dernier.get_forme().setColor(color(0, 255, 0));  break;
            case "BLEU" : dernier.get_forme().setColor(color(0, 0, 255));  break;
            default: dernier.get_forme().setColor(color(random(0,255),random(0,255),random(0,255)));
          }
          if(dernier.get_forme() instanceof Mfja){
            player.rewind();
            player.play();
          }
        }
      }
      mae=FSM.AFFICHER_FORMES;
      clean();
      break;

    case "AGRANDIR":
      if(dernier != null){
        if(dernier.is_linked()){
          dernier.get_forme().increase();
        }
      }
      mae=FSM.AFFICHER_FORMES;
      clean();
      break;

    case "REDUIRE":    
      if(dernier != null){
        if(dernier.is_linked()){
          dernier.get_forme().decrease();
        }
      }
      mae=FSM.AFFICHER_FORMES;
      clean();
      break;

    default:
      print("commande non reconnue");
      break;
  }
}

void geste_received(String template,String confidence){
  last_forme = template;
  switch (mae) {
    case AFFICHER_FORMES:
      mae = FSM.ATTENTE_CLIC;
      clean();
      break;
    default :
      break;
  }
}
