import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  const TextInput({super.key, required this.hintText, required this.labelText});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText),
          Padding(padding: EdgeInsets.only(bottom: 5)),
          TextField(
            keyboardType: TextInputType.multiline, // Enable multiline input
            maxLines: null,
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
          ),
          Padding(padding: EdgeInsets.only(bottom: 15)),
        ],
      ),
    );
  }
}
