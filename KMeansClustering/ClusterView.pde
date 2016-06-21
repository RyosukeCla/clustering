/*
  this view is for 2 dimention.
*/

class ClusterView {
  ArrayList <Cluster> clusters;
  ColorSetting cs;
  public ClusterView () {
    cs = new ColorSetting ();
  }

  public void setClusters (ArrayList<Cluster> clusters) {
    this.clusters = clusters;
    setColors ();
  }

  public void display () {
    background (250);
    noStroke ();
    textAlign(CENTER, CENTER);
    for (int i = 0; i < clusters.size(); i++) {
      Cluster cluster = clusters.get(i);
      fill (this.cs.getOrderedColor (cluster.getIndex()));
      for (int j = 0; j < cluster.getDatas().size(); j++) {
        Vector data = cluster.getDatas().get(j);
        ellipse (data.getAt(0), data.getAt(1), 5.0, 5.0);  
        
      }
      fill (this.cs.getSpecialColor (cluster.getIndex()));
      float size = cluster.getDatas().size() * 0.1 + 10.0;
      ellipse (cluster.getCenter().getAt(0), cluster.getCenter().getAt(1), size, size);

      fill (30, 180);
      textSize(size/4.0);
      text((cluster.getIndex()+1) ,cluster.getCenter().getAt(0), cluster.getCenter().getAt(1) - 5);
    }
    this.displayAxis (20, 20);
  }
  
  public void displayScatterPlot (ArrayList<Vector> datas) {
    background (250);
    noStroke ();
    fill (0);
    for (int i = 0; i < datas.size(); i++) { 
      Vector data = datas.get(i);
      ellipse (data.getAt(0), data.getAt(1), 5.0, 5.0);  
    }
    this.displayAxis (20, 20);
  }
  
  private void displayAxis (float x, float y) {
    stroke (70, 150);
    fill (70, 150);
    textSize (15);
    textAlign (CENTER, CENTER);
    pushMatrix();
    translate (x, y);
    line (-10, 0, 40, 0);
    line (40, 0, 32, -4);
    line (40, 0, 32, 4);
    text ("x", 40, 10);
    line (0, -10, 0, 40);
    line (0, 40, -4, 32);
    line (0, 40, 4, 32);
    text ("y", 10, 40);
    popMatrix();
  }

  private void setColors () {
    for (int i = 0; i < clusters.size(); i++) {
      this.cs.addOrderedColor (new Color (i * 255 / ((float)clusters.size()-0.5) , 255 * random(0.5, 1.0), 255.0 * random(0.7, 1.0)));
    }
    for (int i = 0; i < clusters.size(); i++) {
      this.cs.addSpecialColor (new Color (i * 255 / ((float)clusters.size()-0.5) , 255 * random(0.5, 1.0), 255.0 * random(0.7, 1.0), 100));
    }
  }
}