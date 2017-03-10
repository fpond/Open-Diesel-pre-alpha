class Clock {
  int startTime = 0;
  int stopTime = 0;
  Boolean running = false;

  void start() {
    startTime = millis();
    running = true;
  }

  void stop() {
    stopTime = millis();
    running = false;
  }

  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = millis() - startTime;
    } else {
      elapsed = stopTime - startTime;
    }
    return elapsed;
  }

  int second() {
    return (getElapsedTime()/1000) % 60;
  }

  int minute() {
    return (getElapsedTime()/(1000*60)) % 60;
  }

  int hour() {
    return (getElapsedTime()/(1000*60*60)) % 24;
  }

}