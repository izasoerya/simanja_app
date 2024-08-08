import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

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
          width: width ?? 100,
          height: height ?? 120,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color ?? Colors.grey.shade200,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 60, height: 60, child: image),
              Text(label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 5)),
        enableUnderline != null
            ? enableUnderline!
                ? Container(
                    width: (width ?? 80) / 1.5,
                    height: 5,
                    color: const GlobalTheme().secondaryColor,
                  )
                : const SizedBox()
            : const SizedBox(),
      ],
    );
  }
}
