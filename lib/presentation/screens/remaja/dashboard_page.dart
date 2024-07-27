import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/organism/appbar_content.dart';
import 'package:simanja_app/presentation/widgets/organism/checkup_confirmation.dart';

class DashboardRemaja extends StatelessWidget {
  const DashboardRemaja({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppbarContent(isKader: false),
          Padding(padding: EdgeInsets.only(top: 20)),
          CheckupConfirmation(),
        ],
      ),
    );
  }
}
