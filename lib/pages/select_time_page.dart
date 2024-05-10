import 'package:flutter/material.dart';
import 'package:pomodero_app/style/colors.dart';

import '../utils/time_list.dart';
import '../widgets/buttons_widget.dart';
import '../widgets/time_options.dart';

class SelectTimePage extends StatefulWidget {
  const SelectTimePage({super.key});

  @override
  State<SelectTimePage> createState() => _SelectTimePageState();
}

class _SelectTimePageState extends State<SelectTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgoundColorDarkMode,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const TimeOptions(),
          const SizedBox(height: 30),
          boxButton(
            text: 'Done',
            onPress: () {
              Navigator.pop(context, selectableTimes);
            },
            buttonColor: aerospaceorange,
            buttonHoverColor: hintColorGray,
            textColor: textDarkMode,
          ),
        ],
      ),
    );
  }
}
