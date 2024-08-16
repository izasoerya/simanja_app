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
    return LayoutBuilder(
      builder: (context, constraints) {
        // Measure the height of the text
        final textPainter = TextPainter(
          text: TextSpan(
            text: label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 2.5.w,
              fontWeight: FontWeight.bold,
            ),
          ),
          textDirection: TextDirection.ltr,
          maxLines: 2, // Set max lines to avoid overflow
        )..layout(maxWidth: constraints.maxWidth);

        final textHeight = textPainter.size.height;

        return Column(
          children: [
            Container(
              width: width ?? 22.5.w,
              height: (height ?? 14.h) + textHeight,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color ?? Colors.grey.shade400,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 12.w, height: 8.h, child: image),
                  Text(label,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 3.w,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            enableUnderline != null
                ? enableUnderline!
                    ? Container(
                        width: (width ?? 22.5.w) / 1.5,
                        height: 5,
                        color: const GlobalTheme().secondaryColor,
                      )
                    : const SizedBox()
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
