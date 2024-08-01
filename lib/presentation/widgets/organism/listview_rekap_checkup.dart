import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_nude.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:sizer/sizer.dart';

class ListViewRekapCheckup extends StatelessWidget {
  final List<HealthPropertiesRemaja?> items;
  final bool isFinish;
  const ListViewRekapCheckup({
    super.key,
    required this.items,
    this.isFinish = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Tanggal Posyandu: ${items.isEmpty ? '' : items.first?.checkedAt.toString().substring(0, 10) ?? ''}',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Anemia: ${items.isEmpty ? '0' : items.where((element) => element?.anemia ?? false).length}',
                isFinish: true,
                uid: 'anemia'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Beresiko KEK: ${items.isEmpty ? '0' : items.where((element) => element?.kek ?? false).length}',
                isFinish: true,
                uid: 'kek'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Obesitas: ${items.isEmpty ? '0' : items.where((element) => (element?.weight ?? 0) > 10).length}',
                isFinish: true,
                uid: 'obesitas'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Sangat Kurus: ${items.isEmpty ? '0' : items.where((element) => (element?.weight ?? 0) < 10).length}',
                isFinish: true,
                uid: 'kurus'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Merokok: ${items.isEmpty ? '0' : items.where((element) => element?.smoker ?? false).length}',
                isFinish: true,
                uid: 'merokok'),
            const Padding(padding: EdgeInsets.only(top: 40)),
            !isFinish
                ? SubmitButton(text: 'Tambah Data Checkup', onClick: () {})
                : const SizedBox(),
          ],
        ));
  }
}
