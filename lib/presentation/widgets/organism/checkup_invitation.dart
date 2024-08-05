import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/presentation/provider/provider_checkup.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_checkbox.dart';

class CheckupInvitation extends ConsumerStatefulWidget {
  final List<KaderCheckup>? itemsCheckup;
  final List<EventKader>? itemsEvent;

  const CheckupInvitation({super.key, this.itemsCheckup, this.itemsEvent});

  @override
  ConsumerState<CheckupInvitation> createState() => _CheckupInvitationState();
}

class _CheckupInvitationState extends ConsumerState<CheckupInvitation> {
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    final totalItems =
        (widget.itemsCheckup?.length ?? 0) + (widget.itemsEvent?.length ?? 0);

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: const GlobalTheme().primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.notifications_active,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'Undangan Posyandu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            color: const GlobalTheme().primaryColorLight,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: ListView.separated(
            itemCount: totalItems,
            separatorBuilder: (context, index) => const Divider(
              color: Colors.white,
              height: 20,
            ),
            itemBuilder: (context, index) {
              if (index < (widget.itemsCheckup?.length ?? 0)) {
                // Handle itemsCheckup
                final checkupItem = widget.itemsCheckup![index];
                return _buildCheckupItem(checkupItem, index);
              } else {
                // Handle itemsEvent
                final eventIndex = index - (widget.itemsCheckup?.length ?? 0);
                final eventItem = widget.itemsEvent![eventIndex];
                return _buildEventItem(eventItem, eventIndex);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCheckupItem(KaderCheckup item, int index) {
    Widget itemWidget = ItemListViewCheckbox(
      uid: item.uid,
      title: item.checkupTitle,
      date: item.dateEvent,
      onTap: (Map<String, bool> data) {
        bool resultValue = data[item.uid]!;
        if (resultValue) {
          addCheckup(ref, item);
          selected.add(item.uid);
        } else {
          removeCheckup(ref, item);
          selected.remove(item.uid);
        }
        print(selected);
      },
    );

    if (index == 0) {
      itemWidget = Padding(
        padding: const EdgeInsets.only(top: 10),
        child: itemWidget,
      );
    }
    return itemWidget;
  }

  Widget _buildEventItem(EventKader item, int index) {
    Widget itemWidget = ItemListViewCheckbox(
      uid: item.id,
      title: item.topic,
      date: item.date,
      onTap: (Map<String, bool> data) {
        bool resultValue = data[item.id]!;
        if (resultValue) {
          addEvent(ref, item);
          selected.add(item.id);
        } else {
          removeEvent(ref, item);
          selected.remove(item.id);
        }
        print(selected);
      },
    );

    if (index == 0) {
      itemWidget = Padding(
        padding: const EdgeInsets.only(top: 10),
        child: itemWidget,
      );
    }
    return itemWidget;
  }
}
