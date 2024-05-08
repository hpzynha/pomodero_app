import 'package:flutter/material.dart';
import 'package:pomodero_app/pages/home_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/home': (context) => const HomePage(),
  };

  static String initial = '/';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}
