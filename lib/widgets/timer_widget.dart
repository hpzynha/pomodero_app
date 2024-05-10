import 'package:flutter/material.dart';
import 'package:pomodero_app/service/timer_service.dart';
import 'package:pomodero_app/style/text_styles.dart';
import 'package:provider/provider.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    int totalSeconds = provider.currentDuration.toInt();
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = seconds.toString().padLeft(2, '0');
    String formattedTime = '$formattedMinutes:$formattedSeconds';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          formattedTime,
          style: PomoderoTextStyles.buttonText,
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
