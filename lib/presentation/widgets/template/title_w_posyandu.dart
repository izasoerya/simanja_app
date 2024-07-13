import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/goback_icon.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';

class TitleWPosyandu extends ConsumerWidget {
  const TitleWPosyandu({super.key});

  void onTap() => router.go('/dashboard-kader');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        BackButtonAppbar(
          onTap: () {
            onTap();
            ref.watch(pageIndexProvider.notifier).state = 0;
          },
        ),
        const TemplateTitle(text: 'DATA REMAJA'),
        Text(ref.watch(userKaderProvider).namePosyandu,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: GlobalTheme().secondaryColor)),
        Padding(padding: EdgeInsets.only(top: 15)),
        Container(
          height: 2, // Thickness of the line
          width: MediaQuery.of(context).size.width * 0.8,
          color: Colors.black, // Color of the line
          margin: const EdgeInsets.symmetric(
              horizontal: 20), // Optional: Add some horizontal margin
        ),
      ],
    );
  }
}
