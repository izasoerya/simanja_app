import 'package:flutter/widgets.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_checkup.dart';

class RekapCheckup extends StatelessWidget {
  final List<KaderCheckup> checkupList;
  const RekapCheckup({super.key, required this.checkupList});

  List<KaderCheckup> get sortedData {
    final unfinished =
        checkupList.where((element) => element.isFinish == false).toList();
    final finished = checkupList
        .where((element) => element.isFinish == true)
        .toList()
      ..sort((a, b) => b.dateEvent.compareTo(a.dateEvent));
    return unfinished + finished;
  }

  @override
  Widget build(BuildContext context) {
    double baseHeight = 75.0;
    double maxHeight = MediaQuery.of(context).size.height * 0.2;
    double calculatedHeight = baseHeight * checkupList.length;

    double finalHeight =
        calculatedHeight > maxHeight ? maxHeight : calculatedHeight;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: finalHeight,
      child: ListviewCheckup(checkupList: sortedData),
    );
  }
}
