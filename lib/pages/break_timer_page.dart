import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/widgets/buttons_widget.dart';
import 'package:pomodero_app/widgets/timer_widget.dart';

class BreakTimerPage extends StatelessWidget {
  const BreakTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgoundColorDarkMode,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: TimerWidget(),
          ),
          const SizedBox(height: 30),
          boxButton(
            text: 'breakTimer.stopBreak'.tr(),
            textColor: textDarkMode,
            buttonColor: onyx,
            buttonHoverColor: hintColorGray,
            onPress: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
    );
  }
}
