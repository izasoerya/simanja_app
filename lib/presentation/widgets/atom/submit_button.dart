import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final void Function() onClick;
  const SubmitButton(
      {super.key,
      required this.text,
      this.backgroundColor = const Color.fromRGBO(203, 101, 53, 1),
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: onClick,
          child: Text(text,
              style: GlobalTheme()
                  .headerStyle
                  .copyWith(color: Colors.white, fontSize: 16)),
        ));
  }
}
