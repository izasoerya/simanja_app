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
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jenis Kelamin'),
          Padding(padding: EdgeInsets.only(top: 5)),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.4,
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
              style: GlobalTheme().paragraphStyle,
              hint: const Text('Select Gender'),
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
          Padding(padding: EdgeInsets.only(top: 50)),
        ],
      ),
    );
  }
}
