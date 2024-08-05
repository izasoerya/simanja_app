import 'package:flutter/material.dart';

class ItemListviewIcon extends StatelessWidget {
  final String title;
  final String location;
  final DateTime date;
  const ItemListviewIcon(
      {super.key,
      required this.title,
      required this.location,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.assignment_rounded),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('$location | ${date.toIso8601String().substring(0, 10)}'),
            ],
          ),
        ),
      ],
    );
  }
}
