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
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.1,
              boxColor: GlobalTheme().primaryColor),
        ),
        GestureDetector(
          onTap: () => print('right'),
          child: SmallTextvalueSquareContainer(
              upperText: '',
              lowerText: rightText,
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.1,
              boxColor: GlobalTheme().primaryColor),
        ),
      ],
    );
  }
}
