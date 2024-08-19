import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class TitleWDescription extends StatelessWidget {
  final String title;
  final String description;
  const TitleWDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize:
                  SizerUtil.deviceType == DeviceType.tablet ? 16.sp : 21.sp,
              fontWeight: FontWeight.w800,
              color: const GlobalTheme().primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize:
                  SizerUtil.deviceType == DeviceType.tablet ? 8.sp : 10.sp,
              fontWeight: FontWeight.normal,
              color: const GlobalTheme().secondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
