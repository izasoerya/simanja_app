import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/utils/date_formatter.dart';
import 'package:simanja_app/utils/enums.dart';
import 'package:sizer/sizer.dart';

class UserIdentity extends StatelessWidget {
  final UserRemaja user;
  const UserIdentity({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Identitas Remaja:',
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Text(user.name,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const GlobalTheme().secondaryColor,
            )),
        Text(
          '${user.nik} | ${DateFormatter().convertToIndonesian(user.birthDate)}',
          style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
        ),
        Text(
            user.sex == Gender.male
                ? 'Laki-laki | Umur: ${user.age! ~/ 12} Tahun ${user.age! % 12} Bulan'
                : 'Perempuan | Umur: ${user.age! ~/ 12} Tahun ${user.age! % 12} Bulan',
            style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
