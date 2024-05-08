import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/widgets/splash_animation_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  final String assetName2 = 'assets/images/logo_pomodero.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgoundColorDarkMode,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashAnimationWidget(image: SvgPicture.asset(assetName2))
          ],
        ),
      ),
    );
  }
}
