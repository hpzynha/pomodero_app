import 'package:flutter/material.dart';
import 'package:pomodero_app/service/time_service.dart';
import 'package:pomodero_app/style/text_styles.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/4",
              style: PomoderoTextStyles.titleText,
            ),
            Text(
              "${provider.goal}/12",
              style: PomoderoTextStyles.titleText,
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'ROUND',
              style: PomoderoTextStyles.titleText,
            ),
            Text(
              'GOAL',
              style: PomoderoTextStyles.titleText,
            ),
          ],
        )
      ],
    );
  }
}
