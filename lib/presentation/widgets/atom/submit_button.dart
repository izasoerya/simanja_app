import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  const SubmitButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: GlobalTheme().secondaryColor,
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
