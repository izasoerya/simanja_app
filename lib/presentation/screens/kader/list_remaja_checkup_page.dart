import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_searchbar.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_account.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';

class ListRemajaCheckupPage extends StatelessWidget {
  final String checkupUID;
  const ListRemajaCheckupPage({super.key, required this.checkupUID});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TitleWPosyandu(title: 'DATA REMAJA'),
          const Padding(padding: EdgeInsets.only(top: 30)),
          const CustomSearchBar(label: 'Ihza Surya P...', icon: Icons.search),
          const Padding(padding: EdgeInsets.only(top: 30)),
          FutureBuilder(
              future: KaderCheckupService().getRemajaCheckupList(checkupUID),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return ListViewAccount(users: snapshot.data!);
                }
                return const Text('No users found');
              }),
        ],
      ),
    );
  }
}
