import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/style/text_styles.dart';
import 'package:pomodero_app/widgets/error_messages_widget.dart';
import 'package:pomodero_app/widgets/buttons_widget.dart';
import 'package:pomodero_app/widgets/custom_text_form_field_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final String assetName = 'assets/images/logo_pomodero.svg';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signUserIn() async {
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
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException {
      if (mounted) {
        Navigator.pop(context);
      }
      showErrorSnack('errorMessages.somethingWentWrong'.tr());
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
                title: 'signIn.email'.tr(),
                hintText: 'signIn.enterEmail'.tr(),
                controller: _emailController,
                icon: const Icon(Icons.mail_outline),
                obscureText: false,
                showVisibilityIcon: false,
                validateEmail: true,
                fieldType: FieldType.email,
              ),
              const SizedBox(height: 20),
              CustomTextFormFieldWidget(
                title: 'signIn.password'.tr(),
                hintText: 'signIn.enterPassword'.tr(),
                controller: _passwordController,
                icon: const Icon(Icons.lock_outline),
                obscureText: true,
                showVisibilityIcon: true,
                validateEmail: false,
                fieldType: FieldType.password,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  textButton(
                      text: 'signIn.forgotPassword'.tr(),
                      onPress: () {},
                      color: textDarkMode),
                ],
              ),
              const SizedBox(height: 20),
              primaryButton(onPress: signUserIn, title: 'signIn.signIn'.tr()),
              const SizedBox(height: 15),
              connectWithButton(
                  onPress: () {}, title: 'signIn.signInWithGoogle'.tr()),
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
                          'signIn.dontHaveAnAccount'.tr(),
                          style: PomoderoTextStyles.hintTex,
                        ),
                        textButton(
                            text: 'signIn.signUp'.tr(),
                            onPress: () {
                              Navigator.pushNamed(context, '/signUpPage');
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
