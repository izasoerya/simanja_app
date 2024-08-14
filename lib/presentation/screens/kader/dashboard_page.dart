import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/utils/default_account.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/presentation/widgets/organism/appbar_content.dart';
import 'package:simanja_app/presentation/widgets/organism/small_texticon_square_container.dart';
import 'package:simanja_app/presentation/widgets/template/dashboard_content.dart';

class DashboardKader extends StatelessWidget {
  const DashboardKader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppbarContent(isKader: true),
            const Padding(padding: EdgeInsets.only(top: 30)),
            const TemplateTitle(text: 'DASHBOARD'),
            const Padding(padding: EdgeInsets.only(top: 15)),
            FutureBuilder(
              future:
                  RemajaAuthentication().getUsersbyPosyanduID(kaderAccount.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return DashboardContent(users: snapshot.data!);
                }
                return const Text('Error');
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmallTextIconSquareContainer(
                  lowerText: 'Rekap Pelayanan Kesehatan',
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.15,
                  icon: Icons.medical_services_rounded,
                  onTap: () =>
                      router.push('/login-kader/list-finished-checkup'),
                ),
                SmallTextIconSquareContainer(
                  lowerText: 'Rekap Aktivitas Posyandu',
                  icon: Icons.run_circle_rounded,
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.15,
                  onTap: () =>
                      router.push('/login-kader/list-finished-activity'),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
          ],
        ),
      ),
    );
  }
}
