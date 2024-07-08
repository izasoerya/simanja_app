import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class ChecklistBox extends StatefulWidget {
  final String text;
  const ChecklistBox({super.key, required this.text});

  @override
  State<ChecklistBox> createState() => _ChecklistBoxState();
}

class _ChecklistBoxState extends State<ChecklistBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 5)),
        Checkbox(
          value: isChecked,
          checkColor: Colors.white, // Color of the tick
          fillColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return GlobalTheme().secondaryColor; // Color when checked
            }
            return Colors.white; // Default color (unchecked)
          }),
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(widget.text, style: GlobalTheme().paragraphStyle),
      ],
    );
  }
}