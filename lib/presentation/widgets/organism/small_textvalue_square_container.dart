import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/label_value_text.dart';

class SmallTextvalueSquareContainer extends StatelessWidget {
  final String upperText;
  final String lowerText;
  final double height;
  final double width;
  final Color boxColor;
  const SmallTextvalueSquareContainer(
      {super.key,
      required this.upperText,
      required this.lowerText,
      this.height = 125,
      this.width = 125,
      this.boxColor = const Color.fromRGBO(203, 101, 53, 1)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: boxColor,
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
