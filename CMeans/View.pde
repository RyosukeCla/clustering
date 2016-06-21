class View {
  private ArrayList<Data> datas;
  private ArrayList<Vector> clusters;
  public View (ClustersModel cm) {
    this.datas = cm.getDatas ();
    this.clusters = cm.getClusters ();
  }
  
  public void display () {
    noStroke ();
    for (int i = 0; i < datas.size(); i++) {
      float x = datas.get(i).getData().getAt (0);
      float y = datas.get(i).getData().getAt (1);
      color col = color (datas.get(i).getAttributions().getAt(0) * 100 + 155, datas.get(i).getAttributions().getAt(1) * 100 + 155, datas.get(i).getAttributions().getAt(2) * 100 + 155);
      fill (col);
      ellipse (x, y, 8.0, 8.0);
    }
    
    for (int i = 0; i < clusters.size(); i++) {
      fill (255,50);
      ellipse (clusters.get(i).getAt(0), clusters.get(i).getAt(1), 50, 50);
    }
  }
  
  public void displayDatas () {
    for (int i = 0; i < datas.size(); i++) {
      float x = datas.get(i).getData().getAt (0);
      float y = datas.get(i).getData().getAt (1);            
      fill (0);
      ellipse (x, y, 8.0, 8.0);
    }
  }
}