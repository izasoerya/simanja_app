import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/utils/enums.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key, required this.value});
  final void Function(Gender gender) value;

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String selectedGender = 'Laki-laki';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Jenis Kelamin'),
          const Padding(padding: EdgeInsets.only(top: 5)),
          Container(
            height: 40,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: DropdownButton<String>(
              value: selectedGender,
              style: const GlobalTheme().paragraphStyle,
              hint: const Text('Select Gender'),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(5),
              elevation: 4,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue ?? selectedGender;
                  Gender genderIsMale = selectedGender == 'Laki-laki'
                      ? Gender.male
                      : Gender.female;
                  widget.value(genderIsMale);
                });
              },
              items: <String>['Laki-laki', 'Perempuan']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('   $value'),
                );
              }).toList(),
              underline: Container(), // Hide the underline
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 50)),
        ],
      ),
    );
  }
}
