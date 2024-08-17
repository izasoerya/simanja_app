import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/profile_picture_icon.dart';
import 'package:sizer/sizer.dart';

class ProfilPicture extends StatelessWidget {
  final UserKader? kader;
  final UserRemaja? remaja;
  final bool isSelf;
  const ProfilPicture(
      {super.key, this.kader, this.remaja, required this.isSelf});

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
          Text(
            'PROFIL',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: Colors.white,
            ),
          ),
          if (kader != null) ...buildKaderProfile(context),
          if (remaja != null) ...buildRemajaProfile(context),
        ],
      ),
    );
  }

  List<Widget> buildKaderProfile(BuildContext context) {
    return [
      ProfilePictureIcon(kader: kader, isSelf: isSelf),
      Text(kader!.nameAccount,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold)),
      Text(kader!.email,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal)),
      Text(kader!.address,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal)),
      Text('Akun Kader Posyandu',
          style: TextStyle(
              color: const GlobalTheme().secondaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold)),
    ];
  }

  List<Widget> buildRemajaProfile(BuildContext context) {
    return [
      ProfilePictureIcon(remaja: remaja, isSelf: isSelf),
      Text(remaja!.name,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold)),
      Text(remaja!.email,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal)),
      Text(remaja!.village,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal)),
      Text('Akun Remaja',
          style: TextStyle(
              color: const GlobalTheme().secondaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold)),
    ];
  }
}
