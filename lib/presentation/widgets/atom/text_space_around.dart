import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class TextSpaceAround extends StatelessWidget {
  final String label;
  final String data;
  const TextSpaceAround({super.key, required this.label, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label :',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.visible,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          alignment: Alignment.centerRight,
          child: Text(
            data,
            style: TextStyle(
              color: const GlobalTheme().primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
