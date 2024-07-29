import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/services/remaja_checkup_service.dart';
import 'package:simanja_app/presentation/provider/provider_checkup.dart';
import 'package:simanja_app/presentation/widgets/atom/button_attend.dart';
import 'package:simanja_app/presentation/widgets/atom/button_cancel.dart';
import 'package:simanja_app/presentation/widgets/organism/checkup_invitation.dart';
import 'package:simanja_app/utils/default_account.dart';

class CheckupConfirmation extends ConsumerStatefulWidget {
  final List<KaderCheckup> items;
  final void Function() onTap;
  const CheckupConfirmation(
      {super.key, required this.items, required this.onTap});

  @override
  ConsumerState<CheckupConfirmation> createState() =>
      _CheckupConfirmationState();
}

class _CheckupConfirmationState extends ConsumerState<CheckupConfirmation> {
  void _subscribeCheckup(bool subscribe) async {
    final checkupNotifier = ref.read(checkupProvider.notifier);
    final checkupList = checkupNotifier.state;

    for (var item in checkupList) {
      await (subscribe
          ? RemajaCheckupService()
              .subscribeCheckups(item.uid, remajaAccount.uid)
          : RemajaCheckupService()
              .unsubscribeCheckups(item.uid, remajaAccount.uid));
    }
    checkupNotifier.state = [];
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckupInvitation(items: widget.items),
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
