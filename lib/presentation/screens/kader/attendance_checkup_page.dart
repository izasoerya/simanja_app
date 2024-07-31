import 'package:flutter/widgets.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';

class AttendanceCheckupPage extends StatelessWidget {
  const AttendanceCheckupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleWPosyandu(title: 'Daftar Remaja Checkup'),
        ],
      ),
    );
  }
}
