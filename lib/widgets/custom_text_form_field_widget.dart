import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodero_app/style/colors.dart';
import 'package:pomodero_app/style/text_styles.dart';

enum FieldType {
  email,
  password,
}

class CustomTextFormFieldWidget extends StatefulWidget {
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final Widget icon;
  final bool showVisibilityIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool validateEmail;
  final FieldType fieldType;

  const CustomTextFormFieldWidget(
      {super.key,
      required this.title,
      this.hintText,
      required this.controller,
      e,
      required this.icon,
      required this.showVisibilityIcon,
      required this.obscureText,
      required this.fieldType,
      required this.validateEmail,
      this.validator});

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  late bool _obscureText;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void onTextChanged(String text) {
    setState(() {
      if (widget.fieldType == FieldType.email) {
        // Check if email is valid
        _showError = !widget.validateEmail || !isValidEmail(text);
      } else if (widget.fieldType == FieldType.password) {
        // Show error if the text length is less than 6 characters for password
        _showError = text.length < 6;
      }
    });
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    String errorText = '';
    // Determine the error message based on the field type
    if (_showError) {
      switch (widget.fieldType) {
        case FieldType.email:
          errorText = 'Please enter a valid email address';
          break;
        case FieldType.password:
          errorText = 'Your password should contain at least 6 characters';
          break;
      }
    }
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: PomoderoTextStyles.subtitleDarkMode,
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          style: PomoderoTextStyles.textController,
          obscureText: _obscureText,
          autofocus: true,
          keyboardType:
              widget.validateEmail ? TextInputType.emailAddress : null,
          inputFormatters: widget.validateEmail
              ? [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z0-9@._]'),
                  ),
                ]
              : null,
          onChanged: onTextChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: '',
            hintStyle: PomoderoTextStyles.hintTex,
            prefixIcon: widget.icon,
            suffixIcon: widget.showVisibilityIcon
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: hintColorGray,
                    ),
                  )
                : null,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.only(left: 8, bottom: 16),
            errorText: _showError ? errorText : null,
            fillColor: onyx,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: springGreen),
            ),
          ),
        ),
      ],
    );
  }
}
