import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_image.dart';
import 'package:simanja_app/utils/enums.dart';

class ListViewAccount extends StatelessWidget {
  final List<UserRemaja> users;
  final String redirect;
  const ListViewAccount(
      {super.key, required this.users, required this.redirect});

  void _defaultOnTap(String uidRemaja) {
    print('${redirect}remajaUID=$uidRemaja');
    router.push('${redirect}remajaUID=$uidRemaja');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.5, // Set a fixed height
      child: ListView.separated(
          itemCount: users.length,
          separatorBuilder: (context, index) => const Divider(height: 20),
          itemBuilder: (context, index) {
            final user = users[index];
            return ItemListviewImage(
              title: user.name,
              uid: user.uid,
              descriptions: [
                user.birthDate.toString().substring(0, 10),
                user.sex == Gender.male ? 'Laki-laki' : 'Perempuan',
              ],
              image:
                  user.urlImage != null ? Image.network(user.urlImage!) : null,
              onTap: (data) => _defaultOnTap(user.uid),
            );
          }),
    );
  }
}
