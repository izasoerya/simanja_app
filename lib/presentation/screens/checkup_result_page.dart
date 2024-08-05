import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/widgets/atom/user_identity.dart';
import 'package:simanja_app/presentation/widgets/template/checkup_result_field.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';

class CheckupResultPage extends StatelessWidget {
  final String healthUID;
  const CheckupResultPage({super.key, required this.healthUID});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        RemajaHealthService().getRemajaHealthbyUID(healthUID),
        RemajaHealthService().getRemajaHealthbyUID(healthUID).then(
              (healthData) =>
                  RemajaAuthentication().getUserbyUID(healthData!.uidRemaja!),
            ),
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          final HealthPropertiesRemaja healthData = snapshot.data![0];
          final UserRemaja userData = snapshot.data![1];
          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TitleWPosyandu(title: 'HASIL\nPENIMBANGAN'),
                  UserIdentity(user: userData),
                  CheckupResultField(item: healthData),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text('Data tidak ditemukan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        );
      },
    );
  }
}
