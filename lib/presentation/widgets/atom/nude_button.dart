import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class NudeButton extends StatelessWidget {
  final String text;
  final void Function() redirect;
  const NudeButton({super.key, required this.text, required this.redirect});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: redirect,
      child: Text(
        text,
        style: TextStyle(
          color: GlobalTheme().textColor,
          fontWeight: FontWeight.bold,
          // decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
