import 'package:flutter/material.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/widgets/buttons_widget.dart';

Widget alertDialogWidget({
  required String title,
  required String content,
  required String buttonText,
  required Function() onPress,
}) {
  return AlertDialog(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(color: textDarkMode),
    ),
    content: Text(
      content,
      style: const TextStyle(
        fontSize: 16,
      ),
    ),
    actions: [
      textButton(text: 'OK', onPress: onPress, color: engineeringOrange)
    ],
  );
}
