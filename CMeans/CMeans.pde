ArrayList<Vector> datas;
ClustersModel cm;
View view;
ArrayList <Data> disp;
Slider sl;
Button bt;
boolean start;
void setup () {
  size(700, 700);
  setDatas ();
  cm = new ClustersModel (3, 2.0, datas);
  view = new View (cm);
  disp = cm.getDatas();
  sl = new Slider ("fuzzy");
  bt = new Button ("Classify");
  sl.setPosition (10, 10);
  bt.setPosition (10, 60);
  sl.setTextColor (color (200, 200, 255));
  bt.setTextColor (color (200, 200, 255));
  sl.setRange (1.01, 5.0);
  sl.setInitialValue (2.0);
  bt.setCallback (
    new Callback () {
      public void callback () {
        cm = new ClustersModel (3, sl.getValue(), datas);
        disp = cm.getDatas();
        view = new View (cm);
        start = true;
      }
    }
  );
  start = false;
}

void draw () {
  background (40);
  sl.update();
  bt.update();
  view.display();
  if (start == true) {
    cm.train ();
  }
}


void setDatas () {
  datas = new ArrayList <Vector> ();
  for (int i = 0; i < 200; i++) {
    datas.add (new Vector (width/2 + randomGaussian () * 80, height/2 - 100 + randomGaussian () * 70));
    datas.add (new Vector (randomGaussian() * 73 + width/2 - 200, randomGaussian() * 65 + height/2 + 70));
    datas.add (new Vector (randomGaussian() * 70 + width/2 + 180, randomGaussian() * 67 + height/2 + 100));
  }
}

void mousePressed () {
  sl.mouseListener ();
  bt.mouseListener ();
}

void mouseDragged () {
  sl.mouseListener ();
}