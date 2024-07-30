import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/widgets/atom/item_listview.dart';
import 'package:simanja_app/utils/default_account.dart';
import 'package:simanja_app/utils/enums.dart';

class ListViewAccount extends StatelessWidget {
  const ListViewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.5, // Set a fixed height
      child: FutureBuilder<List<UserRemaja>>(
        future:
            RemajaAuthentication().getUsersbyPosyanduID(remajaAccount.posyandu),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
            final userList = snapshot.data!;
            return ListView.separated(
              itemCount: userList.length,
              separatorBuilder: (context, index) => const Divider(
                height: 20,
              ),
              itemBuilder: (context, index) {
                final user = userList[index];
                return ItemListview(
                  title: user.name,
                  uid: user.uid,
                  descriptions: [
                    user.birthDate.toString().substring(0, 10),
                    user.sex == Gender.male ? 'Laki-laki' : 'Perempuan',
                  ],
                  onTap: (data) {
                    showGeneralDialog(
                        context: context,
                        pageBuilder: (context, _, __) {
                          return AlertDialog(
                            title: Text('Not Implemented yet!'),
                            content:
                                Text('This feature is not implemented yet'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        });
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
