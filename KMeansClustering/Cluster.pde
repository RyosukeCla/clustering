class Cluster {
  private Vector centerPos;
  private ArrayList<Vector> datas;
  private int index;
  public Cluster (int index, int size) {
    centerPos = new Vector (size);
    datas = new ArrayList<Vector> ();
    this.index = index;
  }
  
  public void addData (Vector data) {
    datas.add (data);
  }
  
  public void clear () {
    datas.clear ();
  }
  
  public void calculateCenter () {
    if (datas.size() == 0) {
      centerPos = new Vector (centerPos.size());
      centerPos.toRandomVector ();
      centerPos.mult (width/4);
      centerPos.add (new Vector(width/2, height/2));
      
      return;
    }
    centerPos.toZero();
    for (int i = 0; i < datas.size(); i++) {
      centerPos.add (datas.get(i));
    }
    centerPos.div ((float)datas.size());
  }
  
  public Vector getCenter () {
    return centerPos;
  }
  
  public ArrayList<Vector> getDatas () {
    return this.datas;
  }
  
  public int getIndex () {
    return this.index;
  }
}