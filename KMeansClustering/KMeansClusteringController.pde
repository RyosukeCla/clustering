/*
  this class is so fat that i cant refactoring this because of my neglect.
  i should have created ClustersModel.

*/


class KMeansClusteringController {
  private ArrayList<Cluster> clusters;
  private ArrayList<Vector> datas;
  private ClusterView view;
  
  public KMeansClusteringController () {
  }
  
  public void setupClustering (ArrayList<Vector> datas, int clustersNum) {
    this.datas = datas;
    this.setClusters (clustersNum);
    this.view = new ClusterView ();
    this.view.setClusters (this.clusters);
    this.initialSetClusters();
  }
  
  private void setClusters (int clustersNum) {
    this.clusters = new ArrayList<Cluster> ();
    for (int i = 0; i < clustersNum; i++) {
      Cluster cluster = new Cluster (i, this.datas.get(0).size());
      this.clusters.add (cluster);
    }
  }
  
  public void train (int kaisu) {
    initialSetClusters();
    for (int i = 0; i < kaisu; i++) {
      clearCluster ();
      for (int j = 0; j < datas.size(); j++) {
        setDataCluster (datas.get(j));
      }
      calculateCenter();
    }
  }
  
  public void train () {
    clearCluster ();
    for (int j = 0; j < datas.size(); j++) {
        setDataCluster (datas.get(j));
    }
    calculateCenter ();
  }
  
  public void update () {
    this.view.display();
  }
  
  public void displayScatterPlot () {
    this.view.displayScatterPlot (this.datas);
  }
  
  private void clearCluster () {
    for (int i = 0; i < clusters.size(); i++) {
      clusters.get(i).clear();
    }
  }
  
  private void calculateCenter () {
    Cluster cluster;
    for (int i = 0; i < clusters.size(); i++) {
      cluster = clusters.get(i);
      cluster.calculateCenter ();
    }
  }
  
  private void setDataCluster (Vector data) {
    Vector dist = new Vector (data.size() );
    float minDist = 9999999.0;
    int index = 0;
    for (int i = 0; i < clusters.size(); i++) {
      dist.set (data);
      dist.sub (clusters.get(i).getCenter());
      
      if (minDist > dist.sqrMagnitude ()) {
        minDist = dist.sqrMagnitude ();
        index = i;
      }
    }
    clusters.get(index).addData (data);
  }
  
  public void initialSetClusters() {
    Cluster cluster;
    for (int i = 0; i < clusters.size(); i++) {
      cluster = clusters.get(i);
      cluster.clear();
    }
    
    for (int i = 0; i < datas.size(); i++) {
      int randomClusterIndex = (int)random (0, clusters.size());
      clusters.get(randomClusterIndex).addData(datas.get(i));
    }
    
    for (int i = 0; i < clusters.size(); i++) {
      cluster = clusters.get(i);
      cluster.calculateCenter ();
    }
  }
  
  
}