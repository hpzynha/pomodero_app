import 'package:flutter/material.dart';
import 'package:pomodero_app/service/time_service.dart';
import 'package:pomodero_app/style/text_styles.dart';
import 'package:pomodero_app/utils/time_list.dart';
import 'package:provider/provider.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 245),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () => provider.selectTime(double.parse(time)),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              child: Center(
                  child: Text((int.parse(time) ~/ 60).toString(),
                      style: int.parse(time) == provider.selectedTime
                          ? PomoderoTextStyles.selectedTime
                          : PomoderoTextStyles.selectTime)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
