import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/text_space_around.dart';
import 'package:simanja_app/utils/enums.dart';

class DetailAccount extends StatelessWidget {
  final UserKader? kader;
  final UserRemaja? remaja;
  const DetailAccount({super.key, this.kader, this.remaja});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('DETAIL AKUN',
            style: TextStyle(
                color: const GlobalTheme().secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const Padding(padding: EdgeInsets.only(top: 10)),
        if (kader != null) buildKaderDetail(context),
        if (remaja != null) buildRemajaDetail(context),
      ],
    );
  }

  Widget buildKaderDetail(BuildContext context) {
    return Column(
      children: [
        TextSpaceAround(label: 'Nama Akun', data: kader!.nameAccount),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextSpaceAround(label: 'Nama Posyandu', data: kader!.namePosyandu),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextSpaceAround(label: 'Email', data: kader!.email),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextSpaceAround(
            label: 'Tanggal Lahir',
            data: kader!.birthDate.toString().substring(0, 10)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextSpaceAround(label: 'Alamat', data: kader!.address),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      ],
    );
  }

  Widget buildRemajaDetail(BuildContext context) {
    return Column(
      children: [
        TextSpaceAround(label: 'NIK', data: remaja!.nik),
        TextSpaceAround(label: 'Nama', data: remaja!.name),
        TextSpaceAround(
            label: 'Tanggal Lahir',
            data: remaja!.birthDate.toString().substring(0, 10)),
        TextSpaceAround(
            label: 'Jenis Kelamin',
            data: remaja!.sex == Gender.male ? 'Laki-laki' : 'Perempuan'),
        TextSpaceAround(label: 'Alamat', data: remaja!.address),
        TextSpaceAround(label: 'Email', data: remaja!.email),
      ],
    );
  }
}
