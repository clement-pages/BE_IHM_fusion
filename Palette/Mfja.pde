
/*
 * Classe Rectangle
 */ 
 
public class Mfja extends Forme {
  PImage sprite;
  PImage originSprite;
  int longueur;
  int widthMfja;
  int heightMfja;
  
  public Mfja(Point p) {
    super(p);
    originSprite = loadImage("data/MFJA.png");
    this.longueur=60;
    this.widthMfja = 176;
    this.heightMfja = 100;
    sprite = originSprite.copy();
    sprite.resize(this.widthMfja,this.heightMfja);
  }
   
  public void update() {
    fill(this.c);
    rect((int) this.origin.getX(),(int) this.origin.getY(),this.widthMfja,this.heightMfja);
    image(sprite,this.origin.x,this.origin.y);
  }  
  
  public void increase(){
    this.widthMfja = (int) (this.widthMfja*1.2);
    this.heightMfja = (int) (this.heightMfja*1.2);
    sprite = originSprite.copy();
    sprite.resize(this.widthMfja,this.heightMfja);
  }
  
  public void decrease(){
    this.widthMfja = (int) (this.widthMfja*0.8);
    this.heightMfja = (int) (this.heightMfja*0.8);
    sprite = originSprite.copy();
    sprite.resize(this.widthMfja,this.heightMfja);
  }
  
  boolean isClicked(Point p) {
    return(p.x > origin.x && p.x < (origin.x+sprite.width) && p.y > origin.y && p.y < (origin.y + sprite.height));
  }
  
  // Calcul du périmètre du carré
  protected double perimetre() {
    return(this.longueur*4);
  }
  
  protected double aire(){
    return(this.longueur*this.longueur);
  }
}
