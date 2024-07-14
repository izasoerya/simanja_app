import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';

class BackButtonAppbar extends ConsumerWidget {
  final VoidCallback onTap;
  const BackButtonAppbar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        onTap();
        changePageIndex(ref, 0);
      },
      child: const SizedBox(
        width: 60,
        height: 60,
        child: Icon(Icons.arrow_back_ios_new_sharp),
      ),
    );
  }
}
