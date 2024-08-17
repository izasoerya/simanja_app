import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:sizer/sizer.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final void Function() onClick;
  final Icon? icon;
  const SubmitButton(
      {super.key,
      required this.text,
      this.icon,
      this.backgroundColor = const Color.fromRGBO(203, 101, 53, 1),
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 5,
          ),
          onPressed: onClick,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const GlobalTheme().headerStyle.copyWith(
                    color: Colors.white,
                    fontSize: SizerUtil.deviceType == DeviceType.tablet
                        ? 8.sp
                        : 12.sp),
              ),
              if (icon != null) const SizedBox(width: 8),
              icon ?? const SizedBox(),
            ],
          ),
        ));
  }
}
