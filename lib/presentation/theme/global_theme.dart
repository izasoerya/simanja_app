import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTheme {
  GlobalTheme();

  final Color primaryColor = const Color.fromRGBO(56, 0, 104, 1);

  TextStyle get headerStyle => TextStyle(
        fontFamily: GoogleFonts.openSans().fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      );
}
