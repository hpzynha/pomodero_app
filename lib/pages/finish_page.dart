import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/style/text_styles.dart';
import 'package:pomodero_app/widgets/buttons_widget.dart';

class FinishedPage extends StatefulWidget {
  const FinishedPage({super.key});

  @override
  State<FinishedPage> createState() => _FinishedPageState();
}

class _FinishedPageState extends State<FinishedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgoundColorDarkMode,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'finishPage.congratulations'.tr(),
              style: PomoderoTextStyles.award,
            ),
            Icon(
              Icons.emoji_events,
              size: 250,
              color: awardColor,
            ),
            Text(
              'finishPage.goodJob'.tr(),
              style: PomoderoTextStyles.selectTime,
            ),
            SizedBox(
              height: 30,
            ),
            boxButton(
              text: 'finishPage.break'.tr(),
              textColor: textDarkMode,
              buttonColor: onyx,
              buttonHoverColor: hintColorGray,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
