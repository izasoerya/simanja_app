import 'package:flutter/material.dart';

class EditDataHealthPage extends StatelessWidget {
  final String checkupUID;
  final String remajaUID;
  const EditDataHealthPage({
    super.key,
    required this.checkupUID,
    required this.remajaUID,
  });

  @override
  Widget build(BuildContext context) {
    return Text('checkupuid: $checkupUID, remajaUID: $remajaUID');
  }
}
