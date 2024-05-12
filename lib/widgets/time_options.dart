import 'package:flutter/material.dart';
import 'package:pomodero_app/style/text_styles.dart';
import 'package:pomodero_app/utils/time_list.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    double selectedTime = 1500;
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 155),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              child: Center(
                  child: Text((int.parse(time) ~/ 60).toString(),
                      style: int.parse(time) == selectedTime
                          ? PomoderoTextStyles.selectedTime
                          : PomoderoTextStyles.selectTime)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
