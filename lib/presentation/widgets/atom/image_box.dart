import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:sizer/sizer.dart';

class ImageBox extends StatelessWidget {
  final Image image;
  final String label;
  final double? width;
  final double? height;
  final Color? color;
  final bool? enableUnderline;

  const ImageBox(
      {super.key,
      required this.image,
      required this.label,
      this.width,
      this.height,
      this.color,
      this.enableUnderline});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width ?? 16.w,
          height: height ?? 14.h,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color ?? Colors.grey.shade400,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 10.w, height: 8.h, child: image),
              Text(label,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 6.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 5)),
        enableUnderline != null
            ? enableUnderline!
                ? Container(
                    width: (width ?? 16.w) / 1.5,
                    height: 5,
                    color: const GlobalTheme().secondaryColor,
                  )
                : const SizedBox()
            : const SizedBox(),
      ],
    );
  }
}
