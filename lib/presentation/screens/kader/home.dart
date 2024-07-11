import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/presentation/widgets/organism/appbar_content.dart';
import 'package:simanja_app/presentation/widgets/template/dashboard_content.dart';

class DashboardKader extends ConsumerWidget {
  const DashboardKader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AppbarContent(),
          Padding(padding: EdgeInsets.only(top: 30)),
          TemplateTitle(),
          Padding(padding: EdgeInsets.only(top: 15)),
          DashboardContent(),
        ],
      ),
    );
  }
}
