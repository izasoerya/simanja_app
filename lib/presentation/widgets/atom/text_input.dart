import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextInputType type;
  final TextInputAction action;
  final bool hideText;
  final void Function(String d) value;

  const TextInput({
    super.key,
    required this.hintText,
    required this.labelText,
    this.type = TextInputType.text,
    this.hideText = false,
    this.action = TextInputAction.done,
    required this.value,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText),
          const Padding(padding: EdgeInsets.only(bottom: 5)),
          TextField(
            maxLines: widget.hideText ? 1 : null,
            controller: _controller,
            keyboardType: widget.type,
            obscureText: widget.hideText,
            textInputAction: widget.action,
            inputFormatters: widget.type == TextInputType.number
                ? [_CustomNumberInputFormatter()]
                : [], // Apply the digitsOnly formatter if isNumeric is true
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            style: const GlobalTheme().paragraphStyle,
            onChanged: (data) {
              widget.value(data);
            },
          ),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
        ],
      ),
    );
  }
}

class _CustomNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final regExp = RegExp(r'^[0-9.]*$');
    if (regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
