Clock Clock;
Valve LO_Make_up;
Valve LO_Make_up2;
Valve LO_Drain;
Tank LO_SUMP;

Valve EDG_DO_Make_up;
Tank EDG_Tank;

PImage Valve_Open_img;
PImage Valve_Closed_img;

void setup() {
  //fullScreen();
  frameRate(60);
  size(500, 500);
  background(150);

  Valve_Open_img = loadImage("Valve_Open.png", "png");
  Valve_Closed_img = loadImage("Valve_Closed.png", "png");

  Clock = new Clock(); 
  LO_Make_up = new Valve(45, 400, 5, "LO Make up", false); //postion x, postion y, flowrate
  LO_Make_up2 = new Valve(100, 400, 5, "LO Make up2", false); //postion x, postion y, flowrate
  LO_Drain = new Valve(275, 400, 5, "LO Drain", false); //postion x, postion y, flowrate
  LO_SUMP = new Tank(150, 375, LO_Make_up.statex(), 0.02, false, 0.05, 70.0, "LO SUMP"); //position x, postion y, fill, fill rate, drain, drain rate, level %, name
  
  EDG_DO_Make_up = new Valve(45, 50, 7, "EDG DO Make up", false); //postion x, postion y, flowrate
  EDG_Tank  = new Tank(150, 15, EDG_DO_Make_up.statex(), 0.01, false, 0.05, 58.56, "EDG_Tank"); //position x, postion y, fill, fill rate, drain, drain rate, level %, name
}

void draw() {
  background(150);

  fill(255);
  text(nf(Clock.minute(), 2, 0) + ":" + nf(Clock.second(), 2, 0), 20, 20);

  if (Clock.minute() == 25) {
    //println("YOU HAVE FIVE MINUTES REMAINING");
  }

  LO_Make_up.display(true); //leadingflow: if first valve set to true, if not first valve set to leading valve statex
  LO_Make_up2.display(LO_Make_up.statex()); //leadingflow: if first valve set to true, if not first valve set to leading valve statex
  LO_Drain.display(true); //leadingflow: if first valve set to true, if not first valve set to leading valve statex
  LO_SUMP.display(LO_Make_up2.statex(), LO_Drain.statex()); //boolean fill, boolean drain
  
  EDG_DO_Make_up.display(true); //leadingflow: if first valve set to true, if not first valve set to leading valve statex
  EDG_Tank.display(EDG_DO_Make_up.statex(), false); //boolean fill, boolean drain
}

void mouseReleased() {
  LO_Make_up.click();
  LO_Make_up2.click();
  LO_Drain.click();
  
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