import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutPage extends StatelessWidget {
  const SignOutPage({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.blue,
    );
  }
}
