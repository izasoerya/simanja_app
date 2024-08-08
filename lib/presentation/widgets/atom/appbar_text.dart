import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/services/kader_auth_service.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/utils/default_account.dart';

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
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1.2, // Adjust this value to change the vertical spacing
          ),
          overflow: TextOverflow.visible,
          maxLines: 2,
        ),
        FutureBuilder(
          future: KaderAuthentication().getPosyanduName(remajaAccount.posyandu),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return Text(
                'Peserta Posyandu ${() {
                  return isKader
                      ? ref.watch(userKaderProvider).namePosyandu
                      : snapshot.data;
                }()}',
                style: TextStyle(
                  color: const GlobalTheme().secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              );
            }
            if (isKader) return Text(ref.watch(userKaderProvider).namePosyandu);
            return const Text('Tidak ada data');
          },
        ),
        Text(
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
      ],
    );
  }
}
