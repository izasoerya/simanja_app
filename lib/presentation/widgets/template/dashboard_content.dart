import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:simanja_app/presentation/widgets/organism/dashboard_count_remaja.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [DashboardCountRemaja()],
    );
  }
}
