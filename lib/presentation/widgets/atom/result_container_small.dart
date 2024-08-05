import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:sizer/sizer.dart';

class ResultContainerSmall extends StatelessWidget {
  final String label;
  final String value;
  const ResultContainerSmall(
      {super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const GlobalTheme().primaryColor)),
          child: Text(value,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              textAlign: TextAlign.center),
        )
      ],
    );
  }
}
