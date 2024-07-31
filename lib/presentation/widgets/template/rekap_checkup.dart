import 'package:flutter/widgets.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_checkup.dart';

class RekapCheckup extends StatelessWidget {
  final List<KaderCheckup> checkupList;
  const RekapCheckup({super.key, required this.checkupList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListviewCheckup(checkupList: checkupList),
    );
  }
}
