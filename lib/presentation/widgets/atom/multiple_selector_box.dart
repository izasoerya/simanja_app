import 'package:flutter/material.dart';

class MultipleSelectorBox extends StatefulWidget {
  final Function(String) onTap;
  final List<String> items;

  const MultipleSelectorBox(
      {super.key, required this.onTap, required this.items});

  @override
  _MultipleSelectorBoxState createState() => _MultipleSelectorBoxState();
}

class _MultipleSelectorBoxState extends State<MultipleSelectorBox> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    final halfIndex = (widget.items.length / 2).ceil();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: widget.items.sublist(0, halfIndex).map((item) {
            final isSelected = selectedItem == item;
            return GestureDetector(
              onTap: () {
                setState(() => selectedItem = item);
                widget.onTap(item);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        Column(
          children: widget.items.sublist(halfIndex).map((item) {
            final isSelected = selectedItem == item;
            return GestureDetector(
              onTap: () {
                setState(() => selectedItem = item);
                widget.onTap(item);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.red : Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
