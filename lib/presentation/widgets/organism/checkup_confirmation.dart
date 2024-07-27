import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/button_attend.dart';
import 'package:simanja_app/presentation/widgets/atom/button_cancel.dart';
import 'package:simanja_app/presentation/widgets/atom/checkup_invitation.dart';

class CheckupConfirmation extends StatelessWidget {
  const CheckupConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CheckupInvitation(),
        Padding(padding: EdgeInsets.only(top: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonAttend(),
            ButtonCancel(),
          ],
        ),
      ],
    );
  }
}
