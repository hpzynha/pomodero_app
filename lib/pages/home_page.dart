import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../widgets/buttons_widget.dart';
import '../widgets/timer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
      //   ],
      // ),
      backgroundColor: backgoundColorDarkMode,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/selectTime');
                },
                child: const TimerWidget()),
            const SizedBox(height: 20),
            boxButton(
              text: 'pomoderoActions.startFocus'.tr(),
              textColor: textDarkMode,
              buttonColor: onyx,
              buttonHoverColor: hintColorGray,
              onPress: () {
                Navigator.pushNamed(context, '/pomodoroStart');
              },
            ),
          ],
        ),
      ),
    );
  }
}
