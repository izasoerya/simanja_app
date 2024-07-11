import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simanja_app/presentation/widgets/organism/small_textvalue_square_container.dart';
import 'package:simanja_app/presentation/widgets/organism/wide_textvalue_rectangle.dart.dart';
import 'package:simanja_app/presentation/widgets/organism/big_textvalue_rectangle.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WideTextValueRectangle(),
        const Padding(padding: EdgeInsets.only(top: 5)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const BigTextValueRectangle(),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.18,
                left: 0,
                right: 0,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallTextvalueSquareContainer(
                        upperText: '//Todo:4',
                        lowerText: 'Jumlah Remaja Perempuan'),
                    SmallTextvalueSquareContainer(
                        upperText: '//Todo:4',
                        lowerText: 'Jumlah Remaja Laki-laki'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
