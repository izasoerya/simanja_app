import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class NudeButton extends StatelessWidget {
  final String text;
  const NudeButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
