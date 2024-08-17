import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/appbar_text.dart';
import 'package:sizer/sizer.dart';

class AppbarContent extends StatelessWidget {
  final bool isKader;
  const AppbarContent({super.key, required this.isKader});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 15)),
            Image(
                image: const AssetImage('assets/logo/SiMandja-Logo.png'),
                width: SizerUtil.deviceType == DeviceType.tablet ? 18.w : 100,
                height: SizerUtil.deviceType == DeviceType.tablet ? 18.h : 100),
            Padding(padding: EdgeInsets.only(left: 5.w)),
            Expanded(
              child: AppbarText(isKader: isKader),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
            height: 2,
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.orange,
            margin: const EdgeInsets.symmetric(horizontal: 20)),
      ],
    );
  }
}
