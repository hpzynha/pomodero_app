import 'package:flutter/material.dart';
import 'package:pomodero_app/pages/finish_page.dart';
import 'package:pomodero_app/pages/home_page.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:provider/provider.dart';
import '../service/timer_service.dart';
import '../widgets/holding_button.dart';
import '../widgets/timer_widget.dart';

class PomodoroStartPage extends StatefulWidget {
  const PomodoroStartPage({Key? key}) : super(key: key);

  @override
  State<PomodoroStartPage> createState() => _PomodoroStartPageState();
}

class _PomodoroStartPageState extends State<PomodoroStartPage> {
  late TimerService _timer;

  @override
  void initState() {
    super.initState();
    _timer = Provider.of<TimerService>(context, listen: false);
    _addTimerListener();
    _startTimer();
  }

  void _startTimer() {
    _timer.startTimer();
  }

  void _addTimerListener() {
    _timer.addListener(() {
      if (_timer.isTimerFinished) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FinishedPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgoundColorDarkMode,
      body: Stack(
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: HoldingButton(
                buttonText: 'Hold to Stop Focus',
                holdDuration: const Duration(seconds: 1),
                onPressed: () {
                  _timer.cancelTimer();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                loadingIndicator: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(springGreen),
                ),
                completeIndicator: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.timer.cancel();
    _timer.dispose();
    super.dispose();
  }
}
