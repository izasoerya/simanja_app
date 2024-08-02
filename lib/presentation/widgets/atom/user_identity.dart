import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
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
        Text('Identitas Remaja:', style: TextStyle(fontSize: 8.sp)),
        Text(user.name,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const GlobalTheme().secondaryColor,
            )),
        Row(
          children: [
            Text(user.nik,
                style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold)),
            Text(' | ',
                style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold)),
            Text(user.birthDate.toString().substring(0, 10),
                style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold)),
          ],
        ),
        Text(user.sex == Gender.male ? 'Laki-laki' : 'Perempuan',
            style: TextStyle(fontSize: 8.sp)),
      ],
    );
  }
}
