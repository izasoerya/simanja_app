import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/organism/appbar_content.dart';

class DashboardRemaja extends StatelessWidget {
  const DashboardRemaja({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppbarContent(isKader: false),
      ],
    );
  }
}
