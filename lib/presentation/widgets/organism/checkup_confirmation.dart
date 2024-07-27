import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/checkup_invitation.dart';

class CheckupConfirmation extends StatelessWidget {
  const CheckupConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckupInvitation(),
      ],
    );
  }
}
