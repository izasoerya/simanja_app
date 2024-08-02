import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_searchbar.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_account.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';
import 'package:simanja_app/utils/default_account.dart';

class MemberPage extends ConsumerWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvoked: (didPop) => changePageIndex(ref, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TitleWPosyandu(title: 'DATA REMAJA'),
          const Padding(padding: EdgeInsets.only(top: 30)),
          const CustomSearchBar(label: 'Ihza Surya P...', icon: Icons.search),
          const Padding(padding: EdgeInsets.only(top: 30)),
          FutureBuilder(
              future:
                  RemajaAuthentication().getUsersbyPosyanduID(kaderAccount.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return ListViewAccount(
                      users: snapshot.data!,
                      redirect: '/login-kader/account-remaja?');
                }
                return const Text('No users found');
              }),
        ],
      ),
    );
  }
}
