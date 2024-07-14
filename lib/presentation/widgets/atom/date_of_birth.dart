import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart'; // Add this for date formatting

class DateOfBirthField extends StatefulWidget {
  final String text;
  const DateOfBirthField(
      {super.key, required this.value, this.text = 'Tanggal Lahir'});
  final void Function(DateTime date) value;

  @override
  State<DateOfBirthField> createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    try {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1980), // Adjust based on your requirement
        lastDate: DateTime(2025), // Adjust based on your requirement
      );
      if (picked != null && picked != _selectedDate) {
        setState(() {
          widget.value(picked);
          _selectedDate = picked;
        });
      }
    } catch (e) {
      _selectedDate = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text),
        const Padding(padding: EdgeInsets.only(bottom: 5)),
        SizedBox(
          height: 45,
          child: GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                DateFormat('yyyy-MM-dd')
                    .format(_selectedDate), // Format the date
                style: GlobalTheme().paragraphStyle,
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
      ],
    );
  }
}
