/*****
 * Création d'un nouvelle classe objet : Forme (Cercle, Rectangle, Triangle
 * 
 * Date dernière modification : 28/10/2019
 */

abstract class Forme {
 protected Point origin;
 protected color c;
 
 public Forme(Point p) {
   this.origin=p;
   this.c = color(127);
 }
 
 public Forme(Point p, String c){
   this.origin = p;
   switch(c){
     case "ROUGE" : this.c = color(255, 0, 0);  break;
     case "VERT"  : this.c = color(0, 255, 0);  break;
     case "BLEU"  : this.c = color(0, 0, 255);  break;
     default: this.c = color(127);
   }
 }
 
 public void setColor(color c) {
   this.c=c;
 }
 
 public color getColor(){
   return(this.c);
 }
 
 public abstract void update();
 
 public abstract void increase();
 public abstract void decrease();
 
 public Point getLocation() {
   return(this.origin);
 }
 
 public void setLocation(Point p) {
   this.origin = p;
 }
 
 public abstract boolean isClicked(Point p);
 
 // Calcul de la distance entre 2 points
 protected double distance(Point A, Point B) {
    PVector AB = new PVector( (int) (B.getX() - A.getX()),(int) (B.getY() - A.getY())); 
    return(AB.mag());
 }
 
 protected abstract double perimetre();
 protected abstract double aire();
}
