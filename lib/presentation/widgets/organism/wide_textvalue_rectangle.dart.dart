import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/label_value_text.dart';

class WideTextValueRectangle extends StatelessWidget {
  final List<UserRemaja> users;
  const WideTextValueRectangle({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LabelValueText(
                label: 'non-BPJS:',
                value: users
                    .where((element) => element.bpjs == false)
                    .length
                    .toString(),
                textColor: const GlobalTheme().primaryColor,
                fontSizeUpper: 18,
                fontSizeBottom: 28,
              ),
              LabelValueText(
                label: 'BPJS:',
                value: users
                    .where((element) => element.bpjs == true)
                    .length
                    .toString(),
                textColor: const GlobalTheme().primaryColor,
                fontSizeUpper: 18,
                fontSizeBottom: 28,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
