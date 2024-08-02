import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/widgets/atom/user_identity.dart';
import 'package:simanja_app/presentation/widgets/template/input_health_data.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';

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
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            const TitleWDescription(
                title: 'INPUT PENIMBANGAN',
                description: 'Isi data checkup remaja'),
            const Padding(padding: EdgeInsets.only(top: 15)),
            FutureBuilder(
                future: RemajaAuthentication().getUserbyUID(remajaUID),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      child: UserIdentity(user: snapshot.data!),
                    );
                  }
                  return const Text('No Data Found!'); // Shouldnt be reached
                }),
            const Padding(padding: EdgeInsets.only(top: 30)),
            InputHealthData(),
          ],
        ),
      ),
    );
  }
}
