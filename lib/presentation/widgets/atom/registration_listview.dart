import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/presentation/widgets/atom/check_box.dart';

class RegistrationListview extends StatefulWidget {
  final bool checkBox;
  final KaderCheckup item;
  final void Function(Map<String, bool> callBack) onTap;
  const RegistrationListview({
    super.key,
    this.checkBox = true,
    required this.item,
    required this.onTap,
  });

  Map<String, bool> _mapCheckboxtoUID(String uid, bool value) =>
      Map.from({uid: value});

  @override
  State<RegistrationListview> createState() => _RegistrationListviewState();
}

class _RegistrationListviewState extends State<RegistrationListview> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.checkupTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.item.dateEvent.toIso8601String().substring(0, 10),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              widget.checkBox
                  ? ChecklistBox(
                      text: '',
                      value: (d) {
                        widget.onTap(
                            widget._mapCheckboxtoUID(widget.item.uid, d));
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
