import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';

class CheckupListview extends StatelessWidget {
  final KaderCheckup items;
  final void Function(String callBack) onTap;
  const CheckupListview({
    super.key,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.75,
          color: Colors.yellow[100], //! CHANGE TO SIZEDBOX IN PRODUCTION
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                items.checkupTitle,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
