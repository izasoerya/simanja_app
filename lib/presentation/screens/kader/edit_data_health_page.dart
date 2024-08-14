import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_dropdown.dart';
import 'package:simanja_app/presentation/widgets/atom/user_identity.dart';
import 'package:simanja_app/presentation/widgets/template/input_health_data.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';

class EditDataHealthPage extends StatefulWidget {
  final String checkupUID;
  const EditDataHealthPage({
    super.key,
    required this.checkupUID,
  });

  @override
  _EditDataHealthPageState createState() => _EditDataHealthPageState();
}

class _EditDataHealthPageState extends State<EditDataHealthPage> {
  String? selectedUserUID;

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
                future: KaderCheckupService()
                    .getRemajaCheckupList(widget.checkupUID),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    List<Map<String, String>> users = snapshot.data!
                        .map((e) => {'name': e.name, 'uid': e.uid})
                        .toList();
                    List<String> names = users.map((e) => e['name']!).toList();

                    return CustomDropdown(
                        label: 'Pilih Remaja',
                        hint: 'Pilih Remaja...',
                        items: names,
                        value: users
                                .where((e) => e['uid'] == selectedUserUID)
                                .isNotEmpty
                            ? users.firstWhere(
                                (e) => e['uid'] == selectedUserUID)['name']
                            : null,
                        onChanged: (selectedName) {
                          int index = names.indexOf(selectedName);
                          setState(() {
                            selectedUserUID = users[index]['uid']!;
                          });
                        });
                  }
                  return const Text(
                      'Belum ada remaja mendaftar layanan kesehatan');
                }),
            if (selectedUserUID != null) ...[
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.025)),
              FutureBuilder(
                  future: RemajaAuthentication().getUserbyUID(selectedUserUID!),
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
                    return const Text('No Data Found!'); // Shouldn't be reached
                  }),
              const Padding(padding: EdgeInsets.only(top: 30)),
              InputHealthData(
                  uidCheckup: widget.checkupUID, uidRemaja: selectedUserUID!),
            ],
          ],
        ),
      ),
    );
  }
}
