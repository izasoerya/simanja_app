import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/template/detail_account.dart';
import 'package:simanja_app/presentation/widgets/template/profil_picture.dart';
import 'package:simanja_app/utils/default_account.dart';

class AccountKaderPage extends ConsumerWidget {
  const AccountKaderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
      onPopInvoked: (didPop) {
        router.go('/login-kader/dashboard-kader');
        ref.watch(pageIndexProvider.notifier).state = 0;
      },
      child: Container(
        width: screenWidth,
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: screenHeight * 0.05)),
              ProfilPicture(kader: kaderAccount, isSelf: true),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: DetailAccount(kader: kaderAccount)),
              SizedBox(height: screenHeight * 0.05),
              SubmitButton(
                text: 'Keluar Akun',
                onClick: () {
                  ref.watch(pageIndexProvider.notifier).state = 0;
                  router.go('/');
                },
              ),
              Padding(padding: EdgeInsets.only(top: screenHeight * 0.05)),
            ],
          ),
        ),
      ),
    );
  }
}
