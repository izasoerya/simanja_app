import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/text_space_around.dart';
import 'package:simanja_app/utils/date_formatter.dart';
import 'package:simanja_app/utils/enums.dart';
import 'package:sizer/sizer.dart';

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
                fontSize: 12.sp,
                fontWeight: FontWeight.bold)),
        const Padding(padding: EdgeInsets.only(top: 10)),
        SizedBox(
          width: 80.w,
          child: kader != null
              ? buildKaderDetail(context)
              : buildRemajaDetail(context),
        )
      ],
    );
  }

  Widget buildKaderDetail(BuildContext context) {
    return Column(
      children: [
        TextSpaceAround(label: 'Nama Akun', data: kader!.nameAccount),
        TextSpaceAround(label: 'Nama Posyandu', data: kader!.namePosyandu),
        TextSpaceAround(label: 'Email', data: kader!.email),
        TextSpaceAround(
            label: 'Tanggal Berdiri',
            data: DateFormatter().convertToIndonesian(kader!.birthDate)),
        TextSpaceAround(label: 'Alamat', data: kader!.address),
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
            data: DateFormatter().convertToIndonesian(remaja!.birthDate)),
        TextSpaceAround(
            label: 'Umur',
            data:
                '${(remaja!.age! ~/ 12).toString()} tahun ${remaja!.age! % 12} bulan'),
        TextSpaceAround(
            label: 'Jenis Kelamin',
            data: remaja!.sex == Gender.male ? 'Laki-laki' : 'Perempuan'),
        TextSpaceAround(
            label: 'Jalan',
            data: '${remaja!.street} No. ${remaja!.streetNumber}'),
        TextSpaceAround(
            label: 'RT / RW',
            data: '${remaja!.rt.toString()} / ${remaja!.rw.toString()}'),
        TextSpaceAround(label: 'Alamat', data: remaja!.village),
        TextSpaceAround(label: 'No HP / WA', data: remaja!.phoneNumber),
        TextSpaceAround(label: 'Email', data: remaja!.email),
      ],
    );
  }
}
