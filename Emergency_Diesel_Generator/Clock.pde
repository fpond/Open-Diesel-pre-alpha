class Clock {
  int startTime = 0;
  int stopTime = 0;
  int pauseTime = 0;
  int originalstartTime = 0;
  int running = 0;

  void start() {
    startTime = millis();
    originalstartTime = millis();
    running = 1;
  }

  void pause() {
    pauseTime = millis();
    running = 2;
  }

  void stop() {
    stopTime = millis();
    running = 0;
  }

  int getElapsedTime() {
    int elapsed = 0;
    if (running  == 1) {
      elapsed = millis() - startTime;
    }
    if (running == 2) {
      elapsed = pauseTime - startTime;
      originalstartTime = startTime;
      
    }
    if (running == 0) {
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