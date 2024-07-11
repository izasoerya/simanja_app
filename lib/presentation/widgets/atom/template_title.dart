import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class TemplateTitle extends StatelessWidget {
  final String text;
  const TemplateTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: GlobalTheme().primaryColor,
          fontFamily: GoogleFonts.archivoBlack().fontFamily),
      textAlign: TextAlign.center,
    );
  }
}
