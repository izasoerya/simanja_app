import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';

class ActivityPage extends ConsumerWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvoked: (didPop) => changePageIndex(ref, 0),
      child: const SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleWPosyandu(title: 'KEGIATAN POSYANDU'),
            Text('Activity Page'),
            Text('This is the activity page'),
          ],
        ),
      ),
    );
  }
}
