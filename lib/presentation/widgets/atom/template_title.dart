import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class TemplateTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextStyle? style;

  const TemplateTitle({
    super.key,
    required this.text,
    this.fontSize = 24,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: const GlobalTheme().primaryColor,
      fontFamily: GoogleFonts.archivoBlack().fontFamily,
    );

    return Text(
      text,
      style: style ?? defaultStyle,
      textAlign: TextAlign.center,
    );
  }
}
