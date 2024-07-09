import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:simanja_app/presentation/widgets/organism/dashboard_count_remaja.dart';
import 'package:simanja_app/presentation/widgets/organism/dashboard_remaja_drafted.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DashboardCountRemaja(),
        Padding(padding: EdgeInsets.only(top: 5)),
        DashboardRemajaDrafted(),
      ],
    );
  }
}
