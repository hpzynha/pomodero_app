import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pomodero_app/service/time_service.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/style/text_styles.dart';
import 'package:pomodero_app/widgets/progress_widget.dart';

import 'package:pomodero_app/widgets/timer_controller.dart';
import 'package:pomodero_app/widgets/time_options.dart';
import 'package:pomodero_app/widgets/timer_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          'Pomodero',
          style: PomoderoTextStyles.titleText,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            iconSize: 40,
            onPressed: () {
              Provider.of<TimerService>(context, listen: false).reset();
            },
          ),
        ],
      ),
      backgroundColor: renderColor(provider.currentState),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TimerWidget(),
                ],
              ),
              SizedBox(height: 25),
              TimeOptions(),
              SizedBox(height: 50),
              TimerController(),
              SizedBox(height: 50),
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
