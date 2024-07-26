import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class AppbarText extends ConsumerWidget {
  final bool isKader;
  const AppbarText({super.key, required this.isKader});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selamat Datang,',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          () {
            return isKader
                ? ref.watch(userKaderProvider).nameAccount
                : ref.watch(userRemajaProvider).name;
          }(),
          style: TextStyle(
            color: const GlobalTheme().primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          () {
            return isKader
                ? ref.watch(userKaderProvider).namePosyandu
                : ref.watch(userRemajaProvider).posyandu;
          }(),
          style: TextStyle(
            color: const GlobalTheme().secondaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            () {
              return isKader
                  ? ref.watch(userKaderProvider).address
                  : ref.watch(userRemajaProvider).address;
            }(),
            style: TextStyle(
              color: const GlobalTheme().secondaryColor,
              fontSize: 14,
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
