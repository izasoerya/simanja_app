import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextInputType type;
  final void Function(String d) value;
  const TextInput({
    super.key,
    required this.hintText,
    required this.labelText,
    this.type = TextInputType.text,
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
            maxLines: null,
            controller: _controller,
            keyboardType: TextInputType.text, // Enable multiline input
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 2, horizontal: 10), // Adjusted vertical padding
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
            style: GlobalTheme().paragraphStyle,
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
