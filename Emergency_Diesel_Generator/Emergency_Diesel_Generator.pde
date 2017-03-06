Clock Clock;
Valve LO_Make_up;
Valve EDG_DO_Make_up;

float Lube_Oil = 97.00;
int Lube_Oil_Color = 0;

PImage Valve_Open_img;
PImage Valve_Closed_img;

void setup() {
  frameRate(60);
  size(500, 500);
  background(150);

  Valve_Open_img = loadImage("Valve_Open.png", "png");
  Valve_Closed_img = loadImage("Valve_Closed.png", "png");
  
  Clock = new Clock(20, 20);
  LO_Make_up = new Valve(45, 400, 5);
  EDG_DO_Make_up = new Valve(45, 50, 7);
}

void draw() {
  background(150);
  
  Clock.display();

  textSize(20);
  text("Lube Oil (gallons): " + nf(Lube_Oil, 2, 2), 20, 450);
  fill(0);

  LO_Make_up.display();
  EDG_DO_Make_up.display();
}

void mousePressed() {
  LO_Make_up.click();
  EDG_DO_Make_up.click();
}

void keyPressed() {
  Clock.state();
}