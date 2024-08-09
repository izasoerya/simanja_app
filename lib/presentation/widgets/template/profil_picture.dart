import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/utils/default_account.dart';

class ProfilPicture extends StatelessWidget {
  final UserKader? kader;
  final UserRemaja? remaja;
  const ProfilPicture({super.key, this.kader, this.remaja});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const GlobalTheme().primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'PROFIL',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          CircleAvatar(
            radius: 50,
            // backgroundImage: AssetImage(kaderAccount.photo),
          ),
          Text(kaderAccount.nameAccount,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Text(kaderAccount.email,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
          Text(kaderAccount.address,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
          Text('Akun Kader Posyandu',
              style: TextStyle(
                  color: const GlobalTheme().secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
