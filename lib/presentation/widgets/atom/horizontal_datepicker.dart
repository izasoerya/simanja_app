import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class HorizontalDatePicker extends StatelessWidget {
  final DateTime? startDate;
  final void Function(DateTime) onDateChange;
  const HorizontalDatePicker(
      {super.key, required this.onDateChange, this.startDate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(15.0), // Set the desired border radius
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: const Color.fromARGB(255, 255, 223, 168),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: DatePicker(
              startDate ?? DateTime.now(),
              height: 90,
              initialSelectedDate: DateTime.now(),
              selectionColor: const Color.fromRGBO(203, 101, 53, 1),
              selectedTextColor: Colors.white,
              locale: 'id',
              onDateChange: onDateChange,
            ),
          ),
        ),
      ),
    );
  }
}
