import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class TitleWDescription extends StatelessWidget {
  final String title;
  final String description;
  const TitleWDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const GlobalTheme().primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const GlobalTheme().secondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
