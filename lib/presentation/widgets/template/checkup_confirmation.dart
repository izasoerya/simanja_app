import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/domain/services/remaja_checkup_service.dart';
import 'package:simanja_app/presentation/provider/provider_checkup.dart';
import 'package:simanja_app/presentation/widgets/atom/button_attend.dart';
import 'package:simanja_app/presentation/widgets/atom/button_cancel.dart';
import 'package:simanja_app/presentation/widgets/organism/checkup_invitation.dart';
import 'package:simanja_app/utils/default_account.dart';

class CheckupConfirmation extends ConsumerStatefulWidget {
  const CheckupConfirmation({super.key});

  @override
  ConsumerState<CheckupConfirmation> createState() =>
      _CheckupConfirmationState();
}

class _CheckupConfirmationState extends ConsumerState<CheckupConfirmation> {
  late Future<List<KaderCheckup>> listCheckup;

  void _subscribeCheckup(bool subscribe) async {
    for (var item in ref.watch(checkupProvider.notifier).state) {
      await (subscribe
          ? RemajaCheckupService()
              .subscribeCheckups(item.uid, remajaAccount.uid)
          : RemajaCheckupService()
              .unsubscribeCheckups(item.uid, remajaAccount.uid));
      ref.watch(checkupProvider.notifier).state = [];
    }
    setState(() {
      listCheckup =
          KaderCheckupService().getActiveCheckupList(remajaAccount.posyandu);
    });
  }

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonAttend(onTap: () async => _subscribeCheckup(true)),
            ButtonCancel(onTap: () async => _subscribeCheckup(false)),
          ],
        ),
      ],
    );
  }
}
