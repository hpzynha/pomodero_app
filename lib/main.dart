import 'package:flutter/material.dart';
import 'package:pomodero_app/pages/home_page.dart';
import 'package:pomodero_app/pages/splash_page.dart';

void main() {
  runApp(const PomoderoApp());
}

class PomoderoApp extends StatelessWidget {
  const PomoderoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
