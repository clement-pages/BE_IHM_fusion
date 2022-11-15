class Click extends Point{
  Forme f;
  
  Click(Point p, Forme f){
    super(p.x,p.y);
    this.f = f;
  }
  
  Click(int x, int y, Forme f){
    super(x,y);
    this.f = f;
  }
  
  boolean is_linked(){
    if(this.f == null){
      return false;
    }
    return true;
  }
  
  
  Forme get_forme(){
    return this.f;
  }
  
}
