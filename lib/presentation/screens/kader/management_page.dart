import 'package:flutter/material.dart';
import 'package:simanja_app/utils/enums.dart';
import 'package:simanja_app/presentation/widgets/organism/image_box_selection.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_kas.dart';
import 'package:simanja_app/presentation/widgets/organism/textfield_and_button.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  ManagementObject _selectedObject = ManagementObject.kas;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.05)),
            const TitleWPosyandu(title: 'KELOLA POSYANDU'),
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
            ImageBoxSelection(
                onTap: (ManagementObject object) {
                  setState(() => _selectedObject = object);
                },
                defaultValue: _selectedObject),
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
            ...(_selectedObject == ManagementObject.kas
                ? [
                    TextfieldAndButton(),
                    Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
                    ListviewKas(),
                  ]
                : [
                    Text(''),
                  ]),
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
          ],
        ),
      ),
    );
  }
}
