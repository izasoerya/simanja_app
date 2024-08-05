import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const TitleWPosyandu(title: 'HASIL PENIMBANGAN'),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  UserIdentity(user: userData),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  CheckupResultField(item: healthData),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Catatan Konseling',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const GlobalTheme().primaryColorLight,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const GlobalTheme().primaryColor,
                                width: 1),
                          ),
                          child: Text(
                            healthData.note ?? 'Tidak ada catatan',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                      ],
                    ),
                  ),
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
