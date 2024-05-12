import 'package:flutter/material.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/widgets/buttons_widget.dart';
import 'package:pomodero_app/widgets/time_options.dart';

class TimerOptionsPage extends StatelessWidget {
  const TimerOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkSpringGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' Choose you time'),
            const TimeOptions(),
            SizedBox(height: 20),
            boxButton(
                text: "DONE",
                onPress: () {
                  Navigator.pushNamed(context, '/home');
                })
          ],
        ),
      ),
    );
  }
}
