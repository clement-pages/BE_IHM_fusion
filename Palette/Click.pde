class Click extends Point{
  private Forme f;
  
  public Click(Point p, Forme f){
    super(p.x,p.y);
    this.f = f;
  }
  
  public Click(int x, int y, Forme f){
    super(x,y);
    this.f = f;
  }
  
  public boolean is_linked(){
    if(this.f == null){
      return false;
    }
    return true;
  }
  
  
  public Forme get_forme(){
    return this.f;
  }
  
}
