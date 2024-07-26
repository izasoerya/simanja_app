import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/widgets/atom/item_listview.dart';

class ListviewActivity extends ConsumerWidget {
  const ListviewActivity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      child: FutureBuilder<List<KaderCheckup>>(
        future: KaderCheckupService()
            .getCheckupList(ref.watch(userKaderProvider).uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
            final checkupList = snapshot.data!;
            return ListView.separated(
              itemCount: checkupList.length,
              separatorBuilder: (context, index) => const Divider(
                height: 20,
              ),
              itemBuilder: (context, index) {
                final checkup = checkupList[index];
                return ItemListview(
                    title: checkup.checkupTitle,
                    uid: checkup.uid,
                    descriptions: [
                      checkup.dateEvent.toString().substring(0, 10)
                    ],
                    onTap: (data) {
                      showGeneralDialog(
                          context: context,
                          pageBuilder: (context, _, __) {
                            return AlertDialog(
                              title: Text(data),
                              content: Text(checkup.dateEvent.toString()),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Belum Selesai'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    final response = await KaderCheckupService()
                                        .updateCheckupStatus(checkup.copyWith(
                                            isFinish: true,
                                            dateEvent: DateTime.now()));
                                    if (response != null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Checkup berhasil diselesaikan')));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Checkup gagal diselesaikan')));
                                    }
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Selesai'),
                                ),
                              ],
                            );
                          });
                    });
              },
            );
          }
        },
      ),
    );
  }
}
