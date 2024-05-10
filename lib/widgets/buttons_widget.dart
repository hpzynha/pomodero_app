import 'package:flutter/material.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/style/text_styles.dart';

Widget primaryButton({
  required Function() onPress,
  required String title,
}) {
  return OutlinedButton(
    onPressed: onPress,
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(2),
      side: MaterialStateProperty.all<BorderSide?>(BorderSide.none),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          return hintColorGray
              .withOpacity(0.1); // Set overlay color to transparent
        },
      ),
      backgroundColor: MaterialStateProperty.all<Color>(engineeringOrange),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.all(0.5),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              10), // Adjust the circular border radius here
          // You can also set other properties like side for border thickness and color
          side: const BorderSide(
            color: Colors.black, // Adjust the border color here
            width: 1, // Adjust the border thickness here
          ),
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: PomoderoTextStyles.buttonText,
        ),
      ],
    ),
  );
}

Widget connectWithButton({
  required Function() onPress,
  required String title,
}) {
  return OutlinedButton(
    onPressed: onPress,
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(2),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          return hintColorGray
              .withOpacity(0.1); // Set overlay color to transparent
        },
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.all(0.5),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              10), // Adjust the circular border radius here
          // You can also set other properties like side for border thickness and color
          side: const BorderSide(
            color: Colors.black, // Adjust the border color here
            width: 1, // Adjust the border thickness here
          ),
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 10),
        Image.network(
          'http://pngimg.com/uploads/google/google_PNG19635.png',
          height: 30,
          width: 30,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: PomoderoTextStyles.buttonText,
        ),
      ],
    ),
  );
}

Widget textButton({
  required String text,
  required Function() onPress,
  required Color color,
}) {
  return TextButton(
    onPressed: onPress,
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          return hintColorGray
              .withOpacity(0.1); // Set overlay color to transparent
        },
      ),
    ),
    child: Text(
      text,
      style: PomoderoTextStyles.smallText,
    ),
  );
}

Widget boxButton({
  required String text,
  required Function() onPress,
  required Color buttonColor,
  required Color buttonHoverColor,
  required Color textColor,
}) {
  return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        overlayColor: MaterialStateProperty.all(buttonHoverColor),
        side: MaterialStateProperty.all(BorderSide.none),
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: PomoderoTextStyles.buttonText,
      ));
}
