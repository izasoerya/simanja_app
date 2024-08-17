import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:sizer/sizer.dart';

class ResultContainerSmall extends StatelessWidget {
  final String label;
  final String value;
  final double width;
  final double? height;
  final Color color;
  final TextStyle? textStyle;
  const ResultContainerSmall(
      {super.key,
      required this.value,
      required this.label,
      this.width = 0.4,
      this.height,
      this.color = const Color.fromRGBO(238, 238, 238, 1),
      this.textStyle});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.black,
            )),
        Container(
          height: height,
          width: MediaQuery.of(context).size.width * width,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const GlobalTheme().primaryColor)),
          child: Text(value,
              style: textStyle ??
                  TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
              textAlign: TextAlign.center),
        )
      ],
    );
  }
}
