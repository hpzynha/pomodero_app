import 'package:flutter/material.dart';
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
  final bool obscureText;
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
      required this.fieldType});

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

  @override
  Widget build(BuildContext context) {
    String errorText = '';
    // Determine the error message based on the field type
    if (_showError) {
      switch (widget.fieldType) {
        case FieldType.email:
          errorText = 'wrong email or password';
          break;
        case FieldType.password:
          errorText = 'wrong email or password';
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.emailAddress,
            style: PomoderoTextStyles.textController,
            obscureText: _obscureText,
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
            ),
          ),
        ),
      ],
    );
  }
}
