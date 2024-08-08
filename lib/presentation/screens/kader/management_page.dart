import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/organism/image_box_selection.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';
import 'package:simanja_app/utils/enums.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
          const TitleWDescription(
              title: 'KELOLA POSYANDU', description: 'Informasi Posyandu'),
          Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
          ImageBoxSelection(
              onTap: (ManagementObject object) {
                setState(() => _selectedObject = object);
              },
              defaultValue: _selectedObject),
        ],
      ),
    );
  }
}
