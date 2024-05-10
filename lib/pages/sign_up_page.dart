import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/style/text_styles.dart';
import 'package:pomodero_app/widgets/alert_dialog_widget.dart';
import 'package:pomodero_app/widgets/buttons_widget.dart';
import 'package:pomodero_app/widgets/custom_text_form_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final String assetName = 'assets/images/logo_pomodero.svg';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _comfirmPasswordController =
      TextEditingController();

  Future<void> signUserUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final auth = FirebaseAuth.instance;

    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: engineeringOrange,
            ),
          );
        });

    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (mounted) {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      }
    } on FirebaseAuthException {
      if (mounted) {
        Navigator.pop(context);
        showErrorMessage();
      }
      showErrorMessage();
    }
  }

  void showErrorMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return alertDialogWidget(
              title: 'Worng email or password',
              content: 'ajkhdsjka',
              buttonText: 'OK',
              onPress: () => Navigator.pop(context));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgoundColorDarkMode,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              SvgPicture.asset(assetName),
              const SizedBox(height: 10),
              Text(
                'Stay focused with the Pomodoro Technique',
                style: PomoderoTextStyles.subtitleDarkMode,
              ),
              const SizedBox(height: 20),
              CustomTextFormFieldWidget(
                title: 'Email',
                hintText: 'Enter your email',
                controller: _emailController,
                icon: const Icon(Icons.mail_outline),
                obscureText: false,
                showVisibilityIcon: false,
                fieldType: FieldType.email,
              ),
              const SizedBox(height: 20),
              CustomTextFormFieldWidget(
                title: 'Password',
                hintText: 'Enter your password',
                controller: _passwordController,
                icon: const Icon(Icons.lock_outline),
                obscureText: true,
                showVisibilityIcon: true,
                fieldType: FieldType.email,
              ),
              const SizedBox(height: 20),
              CustomTextFormFieldWidget(
                title: 'Comfir Password',
                hintText: 'Enter your password',
                controller: _comfirmPasswordController,
                icon: const Icon(Icons.lock_outline),
                obscureText: true,
                showVisibilityIcon: true,
                fieldType: FieldType.email,
              ),
              const SizedBox(height: 40),
              primaryButton(onPress: signUserUp, title: 'Sign Up'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: PomoderoTextStyles.hintTex,
                        ),
                        textButton(
                            text: 'Sign In',
                            onPress: () {
                              Navigator.pushNamed(context, '/signInPage');
                            },
                            color: textDarkMode),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
