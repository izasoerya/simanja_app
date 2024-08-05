import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/domain/services/remaja_checkup_service.dart';
import 'package:simanja_app/domain/services/remaja_event_service.dart';
import 'package:simanja_app/presentation/provider/provider_checkup.dart';
import 'package:simanja_app/presentation/widgets/atom/button_attend.dart';
import 'package:simanja_app/presentation/widgets/atom/button_cancel.dart';
import 'package:simanja_app/presentation/widgets/organism/checkup_invitation.dart';
import 'package:simanja_app/utils/default_account.dart';

class CheckupConfirmation extends ConsumerStatefulWidget {
  final List<KaderCheckup>? itemsCheckup;
  final List<EventKader>? itemsEvent;
  final void Function() onTap;
  const CheckupConfirmation(
      {super.key, this.itemsCheckup, this.itemsEvent, required this.onTap});

  @override
  ConsumerState<CheckupConfirmation> createState() =>
      _CheckupConfirmationState();
}

class _CheckupConfirmationState extends ConsumerState<CheckupConfirmation> {
  void _subscribeCheckup(bool subscribe) async {
    final checkupNotifier = ref.read(checkupProvider.notifier);
    final eventNotifier = ref.read(eventProvider.notifier);
    final checkupList = checkupNotifier.state;
    final eventList = eventNotifier.state;

    for (var item in checkupList) {
      await (subscribe
          ? RemajaCheckupService()
              .subscribeCheckups(item.uid, remajaAccount.uid)
          : RemajaCheckupService()
              .unsubscribeCheckups(item.uid, remajaAccount.uid));
    }
    for (var item in eventList) {
      await (subscribe
          ? RemajaEventService().subscribeEvent(item.id, remajaAccount.uid)
          : RemajaEventService().unsubscribeEvent(item.id, remajaAccount.uid));
    }
    checkupNotifier.state = [];
    eventNotifier.state = [];
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckupInvitation(
          itemsCheckup: widget.itemsCheckup!,
          itemsEvent: widget.itemsEvent,
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
