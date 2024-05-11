import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 1500;
  double _selectedTime = 1500;
  bool _isTimerFinished = false;

  double get selectedTime => _selectedTime;
  bool get isTimerFinished => _isTimerFinished;

  set selectedTime(double seconds) {
    _selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners(); // Notify listeners after updating selected time
  }

  void startTimer() {
    _isTimerFinished = false;
    if (!_isTimerFinished) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          if (currentDuration <= 0) {
            timer.cancel();
            _isTimerFinished = true;
            notifyListeners();
          } else {
            currentDuration--;
            notifyListeners();
          }
        },
      );
    }
  }

  void cancelTimer() {
    timer.cancel();
    currentDuration = _selectedTime;
    _isTimerFinished = false;
    notifyListeners();
  }
}
