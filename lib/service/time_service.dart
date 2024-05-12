import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer _timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;
  int rounds = 0;
  int goal = 0;
  String currentState = "FOCUS";

  void start() {
    if (currentState == "BREAK" || currentState == "LONGBREAK") {
      timerPlaying = false; // Do nothing, timer is paused
    } else {
      timerPlaying = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (currentDuration == 0) {
          handleNextRound();
        } else {
          currentDuration--;
          notifyListeners();
        }
      });
    }
  }

  void startBreak() {
    timerPlaying = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    _timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void reset() {
    _timer.cancel();
    currentState = "FOCUS";
    currentDuration = selectedTime = 1500;
    rounds = goal = 0;
    timerPlaying = false;
    notifyListeners();
  }

  void handleNextRound() {
    if (currentState == "FOCUS" && rounds != 3) {
      currentState = "BREAK";
      currentDuration = 300;
      selectedTime = 300;
      rounds++;
      goal++;
      timerPlaying = false;
      _timer.cancel();
    } else if (currentState == "BREAK") {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
      _timer.cancel();
      timerPlaying = false;
    } else if (currentState == "FOCUS" && rounds == 3) {
      currentState = "LONGBREAK";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      goal++;
      timerPlaying = false;
      _timer.cancel();
    } else if (currentState == "LONGBREAK") {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
      _timer.cancel(); // Cancel the timer
      timerPlaying = false;
    }
    notifyListeners();
  }
}
