import 'package:flutter/material.dart';

class PosyanduActivity extends StatelessWidget {
  final String place;
  final String date;
  final String title;
  const PosyanduActivity(
      {super.key,
      required this.place,
      required this.date,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            place,
            style: const TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            date,
            style: const TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
