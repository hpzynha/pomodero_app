import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pomodero_app/service/timer_service.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:provider/provider.dart';

class TimerPicker extends StatefulWidget {
  final int selectedTimeInMinutes; // Add selectedTimeInMinutes parameter

  const TimerPicker({Key? key, required this.selectedTimeInMinutes})
      : super(key: key);

  @override
  State<TimerPicker> createState() => _TimerPickerState();
}

class _TimerPickerState extends State<TimerPicker> {
  late int _currentValueInMinutes;

  @override
  void initState() {
    super.initState();
    _currentValueInMinutes =
        widget.selectedTimeInMinutes ~/ 60; // Convert seconds to minutes
  }

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width;
    final int itemCount = (containerWidth / 70).floor();
    Provider.of<TimerService>(context, listen: false);
    return Consumer<TimerService>(builder: (context, provider, _) {
      return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    color: onyx,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Positioned(
                  height: 60,
                  width: 65,
                  child: Container(
                    decoration: BoxDecoration(
                        color: hintColorGray,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ]),
                  ),
                ),
                Container(
                  child: NumberPicker(
                    textStyle: GoogleFonts.nunito(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    selectedTextStyle: GoogleFonts.nunito(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      color: aerospaceorange,
                    ),
                    axis: Axis.horizontal,
                    step: 5,
                    itemHeight: 60,
                    itemWidth: 80,
                    minValue: 5, // Minimum value in minutes
                    maxValue: 150, // Maximum value in minutes
                    itemCount: itemCount,
                    value: _currentValueInMinutes,
                    onChanged: (v) {
                      setState(() {
                        _currentValueInMinutes = v;
                        provider.selectedTime =
                            v * 60.0; // Convert minutes to seconds
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
