import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/label_value_text.dart';

class SmallTextvalueSquareContainer extends StatelessWidget {
  final String upperText;
  final String lowerText;
  const SmallTextvalueSquareContainer(
      {super.key, required this.upperText, required this.lowerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        color: GlobalTheme().secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LabelValueText(
            label: upperText,
            value: lowerText,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
