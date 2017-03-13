/*
The intended functionality of this Class is to begin a timer.
When F1 is released the timer should start.  When F2 is released the timer should pause and display the time
at which it was stopped.  When F3 is released the timer should stop and display the time at which it stopped.
As if 3.13.2016 the functionality is limited to start and stop, and although the pause function is there it 
does not work.  
*/
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