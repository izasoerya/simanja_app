import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/template/input_inventory_data.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';

class CreateInventoryPage extends StatelessWidget {
  const CreateInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.05)),
            const TitleWDescription(
                title: 'INPUT INVENTORI',
                description: 'Input inventori yang ada di posyandu'),
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
            const InputInventoryData(),
          ],
        ),
      ),
    );
  }
}
