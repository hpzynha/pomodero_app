import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/widgets/buttons_widget.dart';

Widget alertDialogWidget({
  required String title,
  required String content,
  required String buttonText,
  required Function() onPress,
}) {
  return AlertDialog(
    backgroundColor: hintColorGray,
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
    actions: [textButton(text: 'OK', onPress: onPress, color: springGreen)],
  );
}

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    super.key,
    required String message,
    required Color super.backgroundColor,
    required Color textColor,
    required super.duration,
  }) : super(
          content: Text(
            message,
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        );
}
