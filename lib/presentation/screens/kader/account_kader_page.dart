import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/template/detail_account.dart';
import 'package:simanja_app/presentation/widgets/template/profil_picture.dart';
import 'package:simanja_app/utils/default_account.dart';

class AccountKaderPage extends StatelessWidget {
  const AccountKaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: screenHeight * 0.05)),
          ProfilPicture(kader: kaderAccount),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: DetailAccount(kader: kaderAccount)),
          SizedBox(height: screenHeight * 0.05),
          SubmitButton(text: 'Keluar Akun', onClick: () => router.go('/')),
        ],
      ),
    );
  }
}
