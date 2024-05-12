import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer _timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;

  void start() {
    timerPlaying = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      currentDuration--;
      notifyListeners();
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
}
