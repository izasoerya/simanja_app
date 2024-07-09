import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:simanja_app/presentation/widgets/organism/wide_textvalue_rectangle.dart.dart';
import 'package:simanja_app/presentation/widgets/organism/big_textvalue_rectangle.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WideTextValueRectangle(),
        Padding(padding: EdgeInsets.only(top: 5)),
        BigTextValueRectangle(),
      ],
    );
  }
}
