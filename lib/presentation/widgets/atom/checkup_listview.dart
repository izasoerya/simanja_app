import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';

class CheckupListview extends StatefulWidget {
  final KaderCheckup item;
  final void Function(String callBack) onTap;
  const CheckupListview({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  State<CheckupListview> createState() => _CheckupListviewState();
}

class _CheckupListviewState extends State<CheckupListview> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.item.uid);
        isActive = !isActive;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width * 0.85,
            margin: const EdgeInsets.only(left: 15),
            color: isActive
                ? Colors.green
                : Colors.transparent, //! CHANGE TO SIZEDBOX IN PRODUCTION
            child: Column(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
