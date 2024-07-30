import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LabelValueText extends ConsumerWidget {
  final String label;
  final String value;
  final Color textColor;
  final double fontSizeUpper;
  final double fontSizeBottom;
  const LabelValueText({
    super.key,
    required this.label,
    required this.value,
    this.fontSizeUpper = 32,
    this.fontSizeBottom = 16,
    this.textColor = const Color.fromRGBO(203, 101, 53, 1),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        label != ''
            ? Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSizeUpper,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )
            : const SizedBox(),
        value != ''
            ? Text(
                value,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSizeBottom,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )
            : const SizedBox(),
      ],
    );
  }
}
