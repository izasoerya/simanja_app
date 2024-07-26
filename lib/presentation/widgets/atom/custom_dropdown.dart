import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final void Function(String data) onChanged;
  final List<String> items;

  const CustomDropdown({
    super.key,
    required this.onChanged,
    required this.items,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: Container(),
        value: _selectedItem,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedItem = newValue;
            widget.onChanged(newValue!);
            print(newValue);
          });
        },
        hint: const Text('Select an item'),
      ),
    );
  }
}
