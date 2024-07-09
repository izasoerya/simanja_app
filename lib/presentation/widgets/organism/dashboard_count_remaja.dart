import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/label_value_text.dart';

class DashboardCountRemaja extends StatelessWidget {
  const DashboardCountRemaja({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LabelValueText(label: 'Hadir hari ini:', value: '20'),
              LabelValueText(label: 'Memiliki BPJS:', value: '2'),
            ],
          ),
        ],
      ),
    );
  }
}
