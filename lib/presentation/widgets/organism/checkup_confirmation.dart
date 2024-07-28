import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/presentation/widgets/atom/button_attend.dart';
import 'package:simanja_app/presentation/widgets/atom/button_cancel.dart';
import 'package:simanja_app/presentation/widgets/atom/checkup_invitation.dart';
import 'package:simanja_app/utils/default_account.dart';

class CheckupConfirmation extends StatefulWidget {
  const CheckupConfirmation({super.key});

  @override
  State<CheckupConfirmation> createState() => _CheckupConfirmationState();
}

class _CheckupConfirmationState extends State<CheckupConfirmation> {
  late Future<List<KaderCheckup>> listCheckup;

  @override
  void initState() {
    super.initState();
    listCheckup =
        KaderCheckupService().getActiveCheckupList(remajaAccount.posyandu);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: listCheckup,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return CheckupInvitation(
                items: snapshot.data!,
              );
            } else {
              return const CheckupInvitation(items: [null]);
            }
          },
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        const Row(
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
