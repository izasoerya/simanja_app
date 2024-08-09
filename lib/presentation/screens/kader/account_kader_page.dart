import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/template/profil_picture.dart';

class AccountKaderPage extends StatelessWidget {
  const AccountKaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          ProfilPicture(),
        ],
      ),
    );
  }
}
