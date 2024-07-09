import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';

class DashboardKader extends ConsumerWidget {
  const DashboardKader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text('${ref.read(userKaderProvider.notifier).state.uid}'),
        Text('${ref.read(userKaderProvider.notifier).state.name}'),
        Text('${ref.read(userKaderProvider.notifier).state.email}'),
        Text('${ref.read(userKaderProvider.notifier).state.password}'),
      ],
    );
  }
}
