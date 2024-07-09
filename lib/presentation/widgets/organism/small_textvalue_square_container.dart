import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/label_value_text.dart';

class SmallTextvalueSquareContainer extends StatelessWidget {
  const SmallTextvalueSquareContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        color: GlobalTheme().secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LabelValueText(
            label: 'Jumlah Remaja Perempuan',
            value: '//Todo: 4',
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
