class Valve {
  float Flowrate;
  float Flow = 0;
  int x;
  int y;
  Boolean state = true;

  Valve(int tempX, int tempY, float tempFlowrate) {
    x = tempX;
    y = tempY;
    Flowrate = tempFlowrate; //size of the valve (gallons per minute that can flow through the vavle)
  }

  void display() {
    if (state) {
      image(Valve_Closed_img, x, y);
    } else {
      image(Valve_Open_img, x, y);
    }
    textSize(12);
    text("G  " + nf(Flow, 2, 2), x - 10, y - 5);
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
    return !state;
  }
}