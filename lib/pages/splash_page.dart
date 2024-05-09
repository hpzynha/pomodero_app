import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pomodero_app/pages/sign_in_page.dart';
import 'package:pomodero_app/style/colors.dart';

import 'package:pomodero_app/widgets/splash_animation_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  final String assetName = 'assets/images/logo_pomodero.svg';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: backgoundColorDarkMode,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SplashAnimationWidget(
            image: SvgPicture.asset(assetName),
          ),
          const SizedBox(height: 20),
          Text(
            'Stay focused with the Pomodoro Techn ique',
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                color: textDarkMode,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      duration: 2500,
      nextScreen: const SignInPage(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 250,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
