import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_searchbar.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_account.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';

class MemberPage extends ConsumerWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TitleWPosyandu(),
        Padding(padding: EdgeInsets.only(top: 30)),
        CustomSearchBar(label: 'Ihza Surya P...', icon: Icons.search),
        ListViewAccount(),
      ],
    );
  }
}
