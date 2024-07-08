import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTheme {
  GlobalTheme();

  final Color primaryColor = const Color.fromRGBO(89, 43, 119, 1);
  final Color secondaryColor = const Color.fromRGBO(203, 101, 53, 1);
  final Color textColor = const Color.fromRGBO(66, 66, 66, 1);

  TextStyle get headerStyle => TextStyle(
        fontFamily: GoogleFonts.openSans().fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      );
  TextStyle get paragraphStyle => TextStyle(
        fontFamily: GoogleFonts.openSans().fontFamily,
        fontSize: 12,
        // fontWeight: FontWeight.bold,
        color: Colors.black,
      );
}
