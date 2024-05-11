import 'package:flutter/material.dart';
import 'package:pomodero_app/pages/auth_page.dart';
import 'package:pomodero_app/pages/home_page.dart';
import 'package:pomodero_app/pages/pomodoro_start_page.dart';
import 'package:pomodero_app/pages/select_time_page.dart';
import 'package:pomodero_app/pages/sign_in_page.dart';
import 'package:pomodero_app/pages/sign_up_page.dart';
import 'package:pomodero_app/pages/splash_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/': (context) => const SplashPage(),
    '/auth': (context) => const AuthPage(),
    '/home': (context) => const HomePage(),
    '/signInPage': (context) => const SignInPage(),
    '/signUpPage': (context) => const SignUpPage(),
    '/pomodoroStart': (context) => const PomodoroStartPage(),
    '/selectTime': (context) => const SelectTimePage(),
  };

  static String initial = '/';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}
