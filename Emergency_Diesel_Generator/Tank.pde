class Tank {
  float x;
  float y;
  float Level;
  float fillrate;
  float drainrate;
  boolean fill;
  boolean drain;
  String Label = "default tank";

  Tank(float tempX, float tempY, boolean tempfill, float tempfillrate, boolean tempdrain, float tempdrainrate, float tempLevel, String tempLabel) {
    x = tempX;
    y = tempY;
    fill = tempfill; //boolean
    fillrate = tempfillrate;
    drain = tempdrain; //boolean
    drainrate = tempdrainrate;
    Level = tempLevel; //tank level
    Label = tempLabel; //name of the tank
  }

  void display(boolean fill, boolean drain) {     
    fill(200);
    stroke(1);
    rect(x, y, 25, 100);
    
    fill(225, 225, 0);
    
    if (fill) { //filling the tank
      if (Level < 100.0 && Level > 0.0) {
        Level = Level + fillrate;
        fill(255, 255, 0);
      }
    }

    if (drain) { //draining the tank
      if (Level > 0.1) {
        Level = Level - drainrate;
        fill(200, 200, 0);
      }
    }

    if (Level > 80.0 && Level < 90.0 || Level < 40.0) {
      //println("High Level Alarm");
      fill(244, 98, 66);
    }
    
    if (Level > 90.0 || Level < 10.0) {
      fill(255, 0, 0);
    }
    
    if (Level >= 100.0) {
      Level = 100.0;
    }

    //fill(255, 255, 0);
    noStroke();
    rect(x, y - Level + 100.0, 25, Level);
    
    noFill();
    stroke(1);
    rect(x, y, 25, 25);
    rect(x, y, 25, 50);
    rect(x, y, 25, 75);
    rect(x, y, 25, 100);

    fill(255);
    text(Label + " (% fill): " + nf(Level, 2, 2), x - 40, y + 120);
  }
}