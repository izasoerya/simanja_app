import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/goback_icon.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';

class TitleWPosyandu extends ConsumerWidget {
  final String title;
  const TitleWPosyandu({super.key, required this.title});

  void onTap() => router.pop();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          child: BackButtonAppbar(
            onTap: onTap,
          ),
        ),
        TemplateTitle(text: title),
        Text(ref.watch(userKaderProvider).namePosyandu,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: GlobalTheme().secondaryColor)),
        const Padding(padding: EdgeInsets.only(top: 5)),
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width * 0.8,
          color: Colors.black,
          margin: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ],
    );
  }
}
