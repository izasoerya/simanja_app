import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/template/detail_account.dart';
import 'package:simanja_app/presentation/widgets/template/profil_picture.dart';
import 'package:simanja_app/utils/default_account.dart';

class AccountRemajaPage extends ConsumerWidget {
  final String? remajaUID;
  const AccountRemajaPage({super.key, required this.remajaUID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final uid = remajaUID ?? remajaAccount.uid;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: FutureBuilder(
          future: RemajaAuthentication().getUserbyUID(uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.05)),
                  ProfilPicture(
                      remaja: snapshot.data, isSelf: remajaUID == null),
                  Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.05)),
                  DetailAccount(remaja: snapshot.data),
                  remajaAccount.uid == 'dummy'
                      ? const SizedBox()
                      : SubmitButton(
                          text: 'Keluar Akun',
                          onClick: () {
                            ref.watch(pageIndexProvider.notifier).state = 0;
                            router.go('/');
                          },
                        ),
                ],
              );
            }
            return const Text('No user found');
          }),
    );
  }
}
