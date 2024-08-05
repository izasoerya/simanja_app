import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class ImtDescription extends StatelessWidget {
  const ImtDescription({super.key});
  final style = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(89, 43, 119, 1));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          alignment: Alignment.center,
          child: Text('Kategori IMT',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const GlobalTheme().secondaryColor)),
        ),
        Text('< 17             = Sangat Kurus', style: style),
        Text('17 - 18.5     = Kurus', style: style),
        Text('18.5 - 25     = Normal', style: style),
        Text('25 - 27        = Gemuk', style: style),
        Text('> 27             = Obesitas', style: style),
      ],
    );
  }
}
