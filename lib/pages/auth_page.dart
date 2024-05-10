import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pomodero_app/pages/home_page.dart';
import 'package:pomodero_app/pages/sign_in_page.dart';
import '../widgets/loading_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        FirebaseAuth.instance.authStateChanges().listen(
          (User? user) {
            setState(
              () {
                _isLoading = false;
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? loadingIndicator() : buildContent(),
    );
  }

  Widget buildContent() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingIndicator();
        } else {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const SignInPage();
          }
        }
      },
    );
  }
}
