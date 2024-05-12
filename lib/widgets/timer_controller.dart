import 'package:flutter/material.dart';
import 'package:pomodero_app/service/time_service.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:provider/provider.dart';

class TimerController extends StatefulWidget {
  const TimerController({super.key});

  @override
  State<TimerController> createState() => _TimerControllerState();
}

class _TimerControllerState extends State<TimerController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: textDarkMode, shape: BoxShape.circle),
      child: IconButton(
        icon: provider.timerPlaying
            ? const Icon(Icons.pause)
            : const Icon(Icons.play_arrow_sharp),
        iconSize: 55,
        onPressed: () {
          provider.timerPlaying
              ? Provider.of<TimerService>(context, listen: false).pause()
              : Provider.of<TimerService>(context, listen: false).start();
        },
      ),
    );
  }
}
