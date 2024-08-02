import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final void Function(String data) onChanged;
  final String label;
  final List<String> items;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(fontSize: 16)),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: Container(),
            value: _selectedItem,
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(5),
            elevation: 4,
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
            hint: const Text('Pilih Asal Posyandu...'),
          ),
        ),
      ],
    );
  }
}
