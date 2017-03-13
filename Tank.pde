class Tank {
  float x;
  float y;
  float Level;
  float fillrate = 0.1;
  float drainrate = 0.2;
  boolean fill;
  boolean drain;
  String Label = "default tank";

  Tank(float tempX, float tempY, boolean tempfill, boolean tempdrain, float tempLevel, String tempLabel) {
    x = tempX;
    y = tempY;
    fill = tempfill; //boolean
    drain = tempdrain; //boolean
    Level = tempLevel; //tank level
    Label = tempLabel; //name of the tank
  }

  void display() {
    fill = LO_Make_up.statex();
    if (fill) { //filling the tank
      if (Level < 99.9 && Level > 0.1) {
        Level = Level + fillrate;
      }
    }

    if (drain) { //draining the tank
      if (Level > 0.1) {
        Level = Level - drainrate;
      }
    }

    if (Level > 80.0 && Level < 90.0) {
      //println("High Level Alarm");
    }

    fill(255);
    stroke(2);
    rect(x, y, 25, 100);

    fill(255, 255, 0);
    stroke(1);
    rect(x, y - Level + 100.0, 25, Level);

    fill(255);
    text(Label + " (% fill): " + nf(Level, 2, 2) + fill, x - 40, y + 120);
  }
}