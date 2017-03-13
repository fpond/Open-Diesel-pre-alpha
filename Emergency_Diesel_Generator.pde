Clock Clock;
Valve LO_Make_up;
Valve EDG_DO_Make_up;
Tank LO_SUMP;

PImage Valve_Open_img;
PImage Valve_Closed_img;

void setup() {
  frameRate(60);
  size(500, 500);
  background(150);

  Valve_Open_img = loadImage("Valve_Open.png", "png");
  Valve_Closed_img = loadImage("Valve_Closed.png", "png");

  Clock = new Clock();
  LO_Make_up = new Valve(45, 400, 5);
  EDG_DO_Make_up = new Valve(45, 50, 7);
  LO_SUMP = new Tank(150, 375, LO_Make_up.statex(), false, 50.0, "LO SUMP"); //position x, postion y, fill, drain, level %
}

void draw() {
  background(150);

  fill(255);
  text(nf(Clock.minute(), 2, 0) + ":" + nf(Clock.second(), 2, 0), 20, 20);

  if (Clock.minute() == 25) {
    //println("YOU HAVE FIVE MINUTES REMAINING");
  }

  LO_Make_up.display();
  EDG_DO_Make_up.display();
  LO_SUMP.display();
}

void mouseReleased() {
  LO_Make_up.click();
  EDG_DO_Make_up.click();
}

void keyReleased() {
  println(keyCode);
  if (key == CODED) {
    if (keyCode == 112) {
      Clock.start();
    }
    if (keyCode == 113) {
      Clock.pause();
    }
    if (keyCode == 114) {
      Clock.stop();
      println("Stop Time is: " + nf(Clock.minute(), 2, 0) + ":" + nf(Clock.second(), 2, 0));
    }
  }
}