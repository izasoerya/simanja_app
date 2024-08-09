import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kader_finance_service.dart';
import 'package:simanja_app/presentation/widgets/template/input_kas_data.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';
import 'package:simanja_app/utils/default_account.dart';

class CreateMutationPage extends StatelessWidget {
  const CreateMutationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.05)),
            const TitleWDescription(
                title: 'INPUT KAS POSYANDU',
                description: 'Input kas masuk atau keluar posyandu'),
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
            FutureBuilder(
                future:
                    KaderFinanceService().getLastestFinance(kaderAccount.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return InputKasData(lastData: snapshot.data!);
                  }
                  return const InputKasData();
                }),
          ],
        ),
      ),
    );
  }
}
