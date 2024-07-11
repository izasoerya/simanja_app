import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class AppbarText extends ConsumerWidget {
  const AppbarText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selamat Datang,',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ref.watch(userKaderProvider).nameKader,
          style: TextStyle(
            color: GlobalTheme().primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ref.watch(userKaderProvider).namePosyandu,
          style: TextStyle(
            color: GlobalTheme().secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            ref.watch(userKaderProvider).address,
            style: TextStyle(
              color: GlobalTheme().secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
