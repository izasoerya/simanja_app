import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/widgets/template/detail_account.dart';
import 'package:simanja_app/presentation/widgets/template/profil_picture.dart';

class AccountRemajaPage extends StatelessWidget {
  final String remajaUID;
  const AccountRemajaPage({super.key, required this.remajaUID});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: FutureBuilder(
          future: RemajaAuthentication().getUserbyUID(remajaUID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.05)),
                  ProfilPicture(remaja: snapshot.data),
                  Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.05)),
                  DetailAccount(remaja: snapshot.data),
                ],
              );
            }
            return const Text('No user found');
          }),
    );
  }
}
