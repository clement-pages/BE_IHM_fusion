/*
 * Classe Cercle
 */ 
 
public class Cercle extends Forme {
  
  private int rayon;
  
  public Cercle(Point p) {
    super(p);
    this.rayon=80;
  }
  
  public Cercle(Point p, String c) {
    super(p, c);
    this.rayon=80;
  }
   
  public void update() {
    fill(this.c);
    circle((int) this.origin.getX(),(int) this.origin.getY(),this.rayon);
  }  
   
  public boolean isClicked(Point p) {
    // vérifier que le cercle est cliqué
   PVector OM= new PVector( (int) (p.getX() - this.origin.getX()),(int) (p.getY() - this.origin.getY())); 
   if (OM.mag() <= this.rayon/2)
     return(true);
   else 
     return(false);
  }
  
  public void increase() {
    this.rayon = (int)(this.rayon*1.2);
  }
  
  public void decrease() {
    this.rayon = (int)(this.rayon*0.8);
  }
  
  protected double perimetre() {
    return(2*PI*this.rayon);
  }
  
  protected double aire(){
    return(PI*this.rayon*this.rayon);
  }
}
