import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/style/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: engineeringOrange,
        title: Text(
          'Pomodero',
          style: PomoderoTextStyles.titleText,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            iconSize: 40,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: engineeringOrange,
    );
  }
}
