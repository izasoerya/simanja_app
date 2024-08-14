import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:sizer/sizer.dart';

class SmallTextIconSquareContainer extends StatelessWidget {
  final String lowerText;
  final IconData icon;
  final double? width;
  final double? height;
  final void Function()? onTap;
  const SmallTextIconSquareContainer({
    super.key,
    required this.lowerText,
    required this.icon,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 150,
        height: height ?? 125,
        decoration: BoxDecoration(
            color: const GlobalTheme().primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              lowerText,
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
