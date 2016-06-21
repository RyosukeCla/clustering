KMeansClusteringController clustering;
ArrayList<Vector> datas;
Slider sl;
Button bt;
boolean startTrain = false;
void setup () {
  size (1200, 700);
  //fullScreen();
  colorMode (HSB);
  initializeDatas ();
  clustering = new KMeansClusteringController ();
  clustering.setupClustering (datas, 4);
  sl = new Slider ("Clusters");
  sl.isIntegerSlider (true);
  sl.setPosition (width - 200, 20);
  sl.setRange (2, 10);
  sl.setInitialValue (4);
  sl.setTextColor (color(0, 200));
  bt = new Button ("Classify!");
  bt.setPosition (width - 200, 80);
  bt.setTextColor (color(0, 200));
  bt.setCallback (
    new Callback () {
      @Override
      public void callback () {
        startTrain = true;
      }
    }
  );
}

void initializeDatas () {
  datas = new ArrayList <Vector> ();
  for (int i = 0; i < 500; i++) {
    Vector pos = new Vector (width/2 + randomGaussian () * 70, height/2 - 100 + randomGaussian () * 70);
    datas.add (pos);

    pos = new Vector (width/2 + 400 + randomGaussian () * 70, height/2 + 100 + randomGaussian () * 70);
    datas.add (pos);

    pos = new Vector (width/2 - 200 + randomGaussian () * 70, height/2 + 100 + randomGaussian () * 70);
    datas.add (pos);

    pos = new Vector (300 + randomGaussian () * 70, height/2 -140 + randomGaussian () * 70);
    datas.add (pos);
  }
}

void draw () {
  if (startTrain == true) {
    if (frameCount % 1 == 0) {
      clustering.train();
    }
    clustering.update ();
    
  } else {
    clustering.displayScatterPlot ();
  }
  //sl.update ();
  bt.update ();
}

void mousePressed () {
  bt.mouseListener ();
}
void keyPressed () {
  //startTrain = true;
}
void mouseDragged () {
  //sl.mouseListener ();
}