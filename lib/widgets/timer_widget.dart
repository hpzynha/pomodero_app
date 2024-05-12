import 'package:flutter/material.dart';
import 'package:pomodero_app/style/text_styles.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('25:00', style: PomoderoTextStyles.pomodoroTimer);
  }
}
