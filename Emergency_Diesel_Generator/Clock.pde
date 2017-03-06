class Clock {
  int time;
  int second;
  int minute;
  int x;
  int y;
  Boolean clock = false;

  Clock(int tempX, int tempY) {
    x = tempX;
    y = tempY;

    time = 0;
  }

  void display() {
    if (clock) {
      //second = (millis() - time) / 1000;
      //minute = (millis()/ 1000 / 60);
      second = time;
      minute = time/60;
      if (second == 60) {
        time = millis();
      }
    }
    text(nf(minute, 2, 0) + ":" + nf(second, 2, 0), x, y);
  }

  void state() {
    if (key == CODED) {
      if (keyCode == UP) {
        println(millis());
        clock = true;
      }
      if (keyCode == DOWN) {
        clock = false;
      }
    }
  }
}