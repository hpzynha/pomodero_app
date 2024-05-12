import 'package:flutter/material.dart';
import 'package:pomodero_app/style/text_styles.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '0/4',
              style: PomoderoTextStyles.titleText,
            ),
            Text(
              '0/12',
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
