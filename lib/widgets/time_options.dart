import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:provider/provider.dart';

import '../service/timer_service.dart';
import '../utils/time_list.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<TimerService>(context, listen: false);
    return Consumer<TimerService>(builder: (context, provider, _) {
      return SingleChildScrollView(
        controller: ScrollController(initialScrollOffset: 155),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: selectableTimes.map((time) {
            return InkWell(
              onTap: () {
                double selectedSeconds = double.parse(time);
                provider.selectedTime = selectedSeconds;
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                width: 70,
                height: 50,
                child: Center(
                    child: Text(
                  (int.parse(time) ~/ 60).toString(),
                  style: GoogleFonts.nunito(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: double.parse(time) == provider.selectedTime
                        ? springGreen
                        : textDarkMode,
                  ),
                )),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
