import 'package:flutter/material.dart';
import 'package:pomodero_app/style/colors.dart';

class TimerController extends StatefulWidget {
  const TimerController({super.key});

  @override
  State<TimerController> createState() => _TimerControllerState();
}

class _TimerControllerState extends State<TimerController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: textDarkMode, shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(Icons.pause),
        iconSize: 55,
        onPressed: () {},
      ),
    );
  }
}
