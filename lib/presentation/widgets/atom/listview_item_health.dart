import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/utils/enums.dart';
import 'package:sizer/sizer.dart';

class ItemListViewHealth extends StatelessWidget {
  final HealthPropertiesRemaja health;
  final String label;
  final void Function()? onTap;
  const ItemListViewHealth({
    super.key,
    required this.health,
    required this.label,
    this.onTap,
  });

  void _defaultOnTap() {
    print(health.uid);
    router.push('/login-kader/result-health-remaja?healthUID=${health.uid}');
  }

  String _getLabelText(String label) {
    switch (label) {
      case 'Anemia':
        return 'Kadar HB';
      case 'Beresiko KEK':
        return 'Kadar KEK';
      case 'Obesitas':
        return 'Berat Badan';
      case 'Sangat Kurus':
        return 'Berat Badan';
      case 'Merokok':
        return 'Status Merokok';
      case 'all':
        return 'Indek Massa Tubuh';
      default:
        return 'Kadar HB';
    }
  }

  String _getHealthValue(String label, HealthPropertiesRemaja health) {
    switch (label) {
      case 'Anemia':
        return '${health.hemoglobin} gr/dL';
      case 'Beresiko KEK':
        return health.kek!;
      case 'Obesitas':
        return '${health.weight} Kg';
      case 'Sangat Kurus':
        return '${health.weight} Kg';
      case 'Merokok':
        return health.smoker! ? 'Ya' : 'Tidak';
      case 'all':
        if (health.height == null || health.weight == null) {
          return 'nan';
        }
        return (health.weight! /
                (health.height! / 100) *
                (health.height! / 100))
            .toString();
      default:
        return '${health.bloodPressure}';
    }
  }

  String _getHealthStatus(String label) {
    switch (label) {
      case 'Anemia':
        return 'Anemia';
      case 'Beresiko KEK':
        return 'Beresiko KEK';
      case 'Obesitas':
        return 'Obesitas';
      case 'Sangat Kurus':
        return 'Sangat Kurus';
      case 'Merokok':
        return 'Merokok';
      case 'all':
        return health.statusIMT ?? 'belum ada data';
      default:
        return 'Anemia';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => _defaultOnTap(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.symmetric(vertical: 7.5.sp, horizontal: 15.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.5,
            ),
          ],
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: FutureBuilder(
            future: RemajaAuthentication().getUserbyUID(health.uidRemaja!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final UserRemaja user = snapshot.data!;
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.name,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start),
                          Text(user.nik,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.start),
                          Text(
                              '${user.birthDate.toString().substring(0, 10)} | ${user.sex == Gender.male ? 'Laki-laki' : 'Perempuan'}',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.start),
                          Text(
                              user.bpjs
                                  ? 'Pengguna BPJS'
                                  : 'Bukan Pengguna BPJS',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.start),
                        ],
                      ),
                      label != 'all'
                          ? Column(
                              children: [
                                Text(_getLabelText(label),
                                    style: const TextStyle(fontSize: 10)),
                                Text(_getHealthValue(label, health),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const GlobalTheme().primaryColor,
                                    )),
                                Text(_getHealthStatus(label),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: const GlobalTheme().secondaryColor,
                                    )),
                              ],
                            )
                          : Column(
                              children: [
                                Text(_getLabelText('all'),
                                    style: const TextStyle(fontSize: 10)),
                                Text(_getHealthValue('all', health),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: const GlobalTheme().primaryColor,
                                    )),
                                Text(_getHealthStatus('all'),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: const GlobalTheme().secondaryColor,
                                    )),
                              ],
                            ),
                    ]);
              }
              return const Text('Data tidak ditemukan');
            }),
      ),
    );
  }
}
