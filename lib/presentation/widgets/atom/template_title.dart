import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class TemplateTitle extends StatelessWidget {
  const TemplateTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'DASHBOARD',
      style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.normal,
          color: GlobalTheme().primaryColor,
          fontFamily: GoogleFonts.archivoBlack().fontFamily),
    );
  }
}
