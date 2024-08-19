import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/widgets/organism/small_textvalue_square_container.dart';
import 'package:simanja_app/presentation/widgets/organism/wide_textvalue_rectangle.dart.dart';
import 'package:simanja_app/presentation/widgets/organism/big_textvalue_rectangle.dart';
import 'package:simanja_app/utils/enums.dart';
import 'package:sizer/sizer.dart';

class DashboardContent extends StatelessWidget {
  final List<UserRemaja> users;
  const DashboardContent({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WideTextValueRectangle(users: users),
        const Padding(padding: EdgeInsets.only(top: 5)),
        SizedBox(
          height: MediaQuery.of(context).size.height *
              () {
                return SizerUtil.orientation == Orientation.portrait
                    ? 0.35
                    : 0.6;
              }(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              BigTextValueRectangle(users: users),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.18,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallTextvalueSquareContainer(
                        width: MediaQuery.of(context).size.width * 0.3,
                        upperText: users
                            .where((element) => element.sex == Gender.female)
                            .length
                            .toString(),
                        lowerText: 'Remaja Perempuan'),
                    SmallTextvalueSquareContainer(
                        width: MediaQuery.of(context).size.width * 0.3,
                        upperText: users
                            .where((element) => element.sex == Gender.male)
                            .length
                            .toString(),
                        lowerText: 'Remaja Laki-laki'),
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
