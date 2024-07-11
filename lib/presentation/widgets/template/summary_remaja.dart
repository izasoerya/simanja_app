import 'package:flutter/widgets.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/organism/small_textvalue_square_container.dart';

class SummaryRemaja extends StatelessWidget {
  final String leftText;
  final String rightText;
  const SummaryRemaja(
      {super.key, required this.leftText, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () => print('left'),
          child: SmallTextvalueSquareContainer(
              upperText: '',
              lowerText: leftText,
              width: 150,
              height: 100,
              boxColor: GlobalTheme().primaryColor),
        ),
        GestureDetector(
          onTap: () => print('right'),
          child: SmallTextvalueSquareContainer(
              upperText: '',
              lowerText: rightText,
              width: 150,
              height: 100,
              boxColor: GlobalTheme().primaryColor),
        ),
      ],
    );
  }
}
