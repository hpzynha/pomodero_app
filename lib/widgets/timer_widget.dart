import 'package:flutter/material.dart';
import 'package:pomodero_app/service/time_service.dart';
import 'package:pomodero_app/style/text_styles.dart';
import 'package:provider/provider.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = provider.currentDuration % 60;
    final minutes = provider.currentDuration ~/ 60;
    return Row(
      children: [
        Text(
          minutes.toString(),
          style: PomoderoTextStyles.pomodoroTimer,
        ),
        const SizedBox(width: 5),
        Text(
          ':',
          style: PomoderoTextStyles.pomodoroTimer,
        ),
        const SizedBox(width: 5),
        Text(
            seconds == 0
                ? "00"
                : (seconds < 10)
                    ? "0${seconds.round()}"
                    : seconds.round().toString(),
            style: PomoderoTextStyles.pomodoroTimer),
      ],
    );
  }
}
