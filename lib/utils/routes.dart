import 'package:flutter/material.dart';
import 'package:pomodero_app/pages/home_page.dart';
import 'package:pomodero_app/pages/sign_in_page.dart';
import 'package:pomodero_app/pages/splash_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/': (context) => const SplashPage(),
    '/home': (context) => const HomePage(),
    '/signInPage': (context) => const SignInPage(),
  };

  static String initial = '/';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}
