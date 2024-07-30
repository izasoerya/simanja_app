import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/presentation/provider/provider_checkup.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/checkup_listview.dart';

class CheckupInvitation extends ConsumerStatefulWidget {
  final List<KaderCheckup?> items;
  const CheckupInvitation({super.key, required this.items});

  @override
  ConsumerState<CheckupInvitation> createState() => _CheckupInvitationState();
}

class _CheckupInvitationState extends ConsumerState<CheckupInvitation> {
  List<String> selected = [];
  @override
  Widget build(BuildContext context) {
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
            itemCount: widget.items.length,
            separatorBuilder: (context, index) => const Divider(
              color: Colors.white,
              height: 20,
            ),
            itemBuilder: (context, index) {
              Widget item = CheckupListview(
                item: widget.items[index]!,
                onTap: (data) {
                  bool resultValue = data[widget.items[index]!.uid]!;
                  if (resultValue) {
                    addCheckup(ref, widget.items[index]!);
                    selected.add(widget.items[index]!.uid);
                  } else {
                    removeCheckup(ref, widget.items[index]!);
                    selected.remove(widget.items[index]!.uid);
                  }
                  print(selected);
                },
              );

              if (index == 0) {
                item = Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: item,
                );
              }
              return item;
            },
          ),
        ),
      ],
    );
  }
}
