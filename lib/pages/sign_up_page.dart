import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/style/text_styles.dart';
import 'package:pomodero_app/widgets/error_messages_widget.dart';
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        if (mounted) {
          Navigator.pop(context);
        }
        showErrorSnack('errorMessages.emailInUse'.tr());
      } else {
        if (mounted) {
          Navigator.pop(context);
          showErrorSnack('errorMessages.somethingWentWrong'.tr());
        }
      }
    }
  }

  void showErrorSnack(String message) {
    final snackBar = CustomSnackBar(
      message: message,
      backgroundColor: engineeringOrange,
      textColor: textDarkMode,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                'pomodero.pomodero_message'.tr(),
                style: PomoderoTextStyles.subtitleDarkMode,
              ),
              const SizedBox(height: 20),
              CustomTextFormFieldWidget(
                title: 'signUp.email'.tr(),
                hintText: 'signUp.enterEmail'.tr(),
                controller: _emailController,
                icon: const Icon(Icons.mail_outline),
                obscureText: false,
                showVisibilityIcon: false,
                validateEmail: true,
                fieldType: FieldType.email,
              ),
              const SizedBox(height: 20),
              CustomTextFormFieldWidget(
                title: 'signUp.password'.tr(),
                hintText: 'signUp.enterPassword'.tr(),
                controller: _passwordController,
                icon: const Icon(Icons.lock_outline),
                obscureText: true,
                showVisibilityIcon: true,
                validateEmail: false,
                fieldType: FieldType.password,
              ),
              const SizedBox(height: 20),
              CustomTextFormFieldWidget(
                title: 'signUp.comfirmPassword'.tr(),
                hintText: 'signUp.comfirmPassword'.tr(),
                controller: _comfirmPasswordController,
                icon: const Icon(Icons.lock_outline),
                obscureText: true,
                showVisibilityIcon: true,
                validateEmail: false,
                fieldType: FieldType.password,
              ),
              const SizedBox(height: 40),
              primaryButton(
                onPress: signUserUp,
                title: 'signUp.signUp'.tr(),
              ),
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
                          'signUp.alreadyHaveAnAccount'.tr(),
                          style: PomoderoTextStyles.hintTex,
                        ),
                        textButton(
                            text: 'signUp.signIn'.tr(),
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
