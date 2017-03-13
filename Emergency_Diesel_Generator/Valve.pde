class Valve {
  float Flowrate;
  float Flow = 0;
  int x;
  int y;
  String Label;
  boolean state = true;
  boolean flow = false;
  boolean leadingflow = false;

  Valve(int tempX, int tempY, float tempFlowrate, String tempLabel, boolean tempLeadingflow) {
    x = tempX;
    y = tempY;
    Flowrate = tempFlowrate; //size of the valve (gallons per minute that can flow through the vavle)
    Label = tempLabel;
    leadingflow = tempLeadingflow;
  }

  void display(boolean leadingflow) {
    if (leadingflow) {
      flow = true;
      println(Label + "leadingflow: " + leadingflow + " state: " + state);
    } else {
      flow = false;
    }

    if (state) {
      image(Valve_Closed_img, x, y);
    } else {
      image(Valve_Open_img, x, y);
    }
    fill(255);
    textSize(12);
    text("G  " + nf(Flow, 2, 2), x - 10, y - 5);

    if (mouseX > x && mouseX < (x + 30) && mouseY > y && mouseY < (y + 25)) {
      fill(0);
      text(Label, 10, height - 5);
    }
    //println(Label + "flow: " + flow + " leading flow: " + leadingflow + " state: " + state);
  }

  void click() {
    if (mouseX > x && mouseX < (x + 30) && mouseY > y && mouseY < (y + 25)) {
      if (mouseButton == LEFT) { //Open
        state = false;
      }
      if (mouseButton == RIGHT) { //Closed
        state = true;
      }
    }
  }

  boolean statex() {
    if (flow && !state) {
      return !state;
    } else {
      return false;
    }
  }
}