import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:sizer/sizer.dart';

class TextSpaceAround extends StatelessWidget {
  final String label;
  final String data;
  const TextSpaceAround({super.key, required this.label, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label :',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.visible,
          ),
          Container(
            width: 40.w,
            alignment: Alignment.centerRight,
            child: Text(
              data,
              style: TextStyle(
                color: const GlobalTheme().primaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
