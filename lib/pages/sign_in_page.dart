import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/style/text_styles.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgoundColorDarkMode,
      body: Padding(
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
            const SizedBox(height: 40),
            CustomTextFormFieldWidget(
              title: 'Email',
              hintText: 'Enter your email',
              controller: _emailController,
              icon: const Icon(Icons.mail_outline),
              obscureText: false,
              showVisibilityIcon: false,
              fieldType: FieldType.email,
            ),
            const SizedBox(height: 40),
            CustomTextFormFieldWidget(
              title: 'Password',
              hintText: 'Enter your password',
              controller: _passwordController,
              icon: const Icon(Icons.lock_outline),
              obscureText: true,
              showVisibilityIcon: true,
              fieldType: FieldType.email,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                textButton(
                    text: 'Forgot password?',
                    onPress: () {},
                    color: textDarkMode),
              ],
            ),
            const SizedBox(height: 40),
            primaryButton(onPress: () {}, title: 'Sign In'),
            const SizedBox(height: 15),
            connectWithButton(onPress: () {}, title: 'Sign In With Google'),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
