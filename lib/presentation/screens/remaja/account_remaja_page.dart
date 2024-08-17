import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/template/detail_account.dart';
import 'package:simanja_app/presentation/widgets/template/profil_picture.dart';
import 'package:simanja_app/utils/default_account.dart';
import 'package:sizer/sizer.dart';

class AccountRemajaPage extends ConsumerWidget {
  final String? remajaUID;
  const AccountRemajaPage({super.key, this.remajaUID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = remajaUID ?? remajaAccount.uid;

    return PopScope(
      onPopInvoked: (didPop) => ref.watch(pageIndexProvider.notifier).state = 0,
      child: Container(
        width: 100.w,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        child: FutureBuilder(
            future: RemajaAuthentication().getUserbyUID(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return const Text('No user found');
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 5.h)),
                      ProfilPicture(
                          remaja: snapshot.data, isSelf: remajaUID == null),
                      Padding(padding: EdgeInsets.only(bottom: 5.h)),
                      DetailAccount(remaja: snapshot.data),
                      Padding(padding: EdgeInsets.only(bottom: 5.h)),
                      remajaAccount.uid == 'dummy'
                          ? const SizedBox()
                          : SubmitButton(
                              text: 'Keluar Akun',
                              onClick: () {
                                ref.watch(pageIndexProvider.notifier).state = 0;
                                router.go('/');
                              },
                            ),
                      Padding(padding: EdgeInsets.only(bottom: 5.h)),
                    ],
                  ),
                );
              }
              return const Text('No user found');
            }),
      ),
    );
  }
}
