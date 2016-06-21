/*

this class, Slider was created a year ago.
so this class are fu*k codes because of my ignorance about object-oriented programming.
Button class is also fu*k codes!

*/

class Slider {
  private float xpos, ypos;
  private float rangeA, rangeB;
  private float sliderPosition;
  private float sliderWidth;
  private float sliderHeight;
  private boolean isInteger;
  private String name;
  private color textCol;
  Slider(String name) {
    this.name = name;
    this.xpos = 0.0;
    this.ypos = 0.0;
    this.rangeA = 0.0;
    this.rangeB = 1.0;
    this.sliderPosition = 50.0;
    this.sliderWidth = 100.0;
    this.sliderHeight = 16.0;
    this.textCol = color (250,30);
  }
  void setPosition(float x, float y) {
    this.xpos = x;
    this.ypos = y;
  }
  float getPositionX() {
    return this.xpos;
  }
  float getPositionY() {
    return this.ypos;
  }
  void setRange(float ra, float rb) {
    this.rangeA = ra;
    this.rangeB = rb;
  }
  void isIntegerSlider(Boolean isI) {
    isInteger = isI;
  }
  void setInitialValue(float x) {
    sliderPosition = sliderWidth * (x - rangeA) / (rangeB - rangeA);
  }
  void setTextColor (color col) {
    this.textCol = col;
  }
  float getValue() {
    return rangeA + (rangeB - rangeA) * sliderPosition / sliderWidth;
  }
  boolean isInsideSlider() {
    if (mouseX>=xpos-8 && mouseX<=xpos+sliderWidth+8 && mouseY>=ypos-sliderHeight/2.0 && mouseY<=ypos+sliderHeight*3.8/2.0) return true;
    else return false;
  }
  void mouseListener() {
    if (isInsideSlider() == true) {
      if (mousePressed) {
        sliderPosition = mouseX - xpos - 1;
        if (isInteger == true) setInitialValue((int)getValue());
        if (sliderPosition > sliderWidth) sliderPosition = sliderWidth;
        if (sliderPosition < 0) sliderPosition = 0;
      }
    }
  }
  void update() {
    pushMatrix();
    stroke(255, 255, 255, 255);
    strokeWeight(1);
    fill(255, 255, 255, 100);
    translate(xpos, ypos);
    line(0, 0, 0, sliderHeight);
    line(0, sliderHeight/2.0, sliderWidth, sliderHeight/2.0);
    line(sliderWidth, 0, sliderWidth, sliderHeight);
    line(sliderWidth/2.0, sliderHeight*0.2, sliderWidth/2.0, sliderHeight*0.8);
    rect(sliderPosition-sliderWidth/30.0+1.0/2.0, 0, sliderWidth/15.0, sliderHeight);
    fill(this.textCol);
    textSize(sliderHeight/1.5);
    textAlign(LEFT, CENTER);
    text(name, sliderWidth*1.1, sliderHeight/2.0);
    textSize(sliderHeight/1.8);
    textAlign(CENTER, TOP);
    text(rangeA, 0, sliderHeight*1.1);
    text(rangeB, sliderWidth, sliderHeight*1.1);
    textAlign(CENTER, BOTTOM);
    text(getValue(), sliderPosition, 0);
    popMatrix();
  }
}

class Button {
  private PVector pos;
  private String name;
  private float buttonHeight;
  private float buttonWidth;
  private Callback callback;
  private color textCol;
  
  public Button (String name) {
    this.name = name;
    this.pos = new PVector (0, 0);
    this.buttonWidth = 100.0;
    this.buttonHeight = 16.0;
    this.textCol = color (250, 30);
  }
  
  public void setPosition(float x, float y) {
    this.pos.x = x;
    this.pos.y = y;
  }
  
  public void setTextColor (color col) {
    this.textCol = col;
  }
  
  public void setCallback (Callback cb) {
    this.callback = cb;
  }
  
  boolean isInside() {
    if (mouseX>=pos.x && mouseX<=pos.x+buttonWidth && mouseY>=pos.y && mouseY<=pos.y+buttonHeight) return true;
    else return false;
  }
  
  void mouseListener() {
    if (isInside() == true) {
      if (mousePressed) {
        if (this.callback != null) {
          this.callback.callback ();
        } else {
          println ("is not set callback");
        }
      }
    }
  }
  
  public void update () {
    pushMatrix ();
    fill (255, 255, 255, 100);
    translate (this.pos.x, this.pos.y);
    rect (0, 0, buttonWidth, buttonHeight);
    
    textAlign (CENTER, CENTER);
    textSize (buttonHeight/1.8);
    fill (this.textCol);
    text (name, buttonWidth/2.0, buttonHeight/2.0 - 2.0);
    popMatrix();
  }
}