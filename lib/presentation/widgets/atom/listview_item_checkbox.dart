import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/check_box.dart';

class ItemListViewCheckbox extends StatefulWidget {
  final String uid;
  final String title;
  final String label;
  final DateTime date;
  final void Function(Map<String, bool> callBack) onTap;
  const ItemListViewCheckbox({
    super.key,
    required this.uid,
    required this.title,
    this.label = '',
    required this.date,
    required this.onTap,
  });

  Map<String, bool> _mapCheckboxtoUID(String uid, bool value) =>
      Map.from({uid: value});

  @override
  State<ItemListViewCheckbox> createState() => _ItemListViewCheckboxState();
}

class _ItemListViewCheckboxState extends State<ItemListViewCheckbox> {
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
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.date.toIso8601String().substring(0, 10),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              ChecklistBox(
                text: widget.label,
                value: (d) {
                  widget.onTap(widget._mapCheckboxtoUID(widget.uid, d));
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
