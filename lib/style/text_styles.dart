import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodero_app/style/colors.dart';

class PomoderoTextStyles {
  static final TextStyle subtitleDarkMode = GoogleFonts.nunito(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textDarkMode,
  );

  static final TextStyle body = GoogleFonts.nunito(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.grey[800],
  );
  static final TextStyle titleText = GoogleFonts.nunito(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textDarkMode,
  );

  static final TextStyle hintTex = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: hintColorGray,
  );

  static final TextStyle textController = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textDarkMode,
  );
  static final TextStyle buttonText = GoogleFonts.nunito(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textDarkMode,
  );

  static final TextStyle smallText = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textDarkMode,
  );

  static final TextStyle pomodoroTimer = GoogleFonts.nunito(
    fontSize: 96,
    fontWeight: FontWeight.bold,
    color: textDarkMode,
  );
  static final TextStyle selectTime = GoogleFonts.nunito(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: textDarkMode,
  );
  static final TextStyle award = GoogleFonts.nunito(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: awardColor,
  );

  // Adicione mais estilos conforme necessário...
}
