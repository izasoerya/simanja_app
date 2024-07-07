import 'package:simanja_app/utils/enums.dart';

class UserRemaja {
  final String uid;
  final String name;
  final String nik;
  final Gender sex;
  final DateTime birthDate;
  final String address;
  final bool bpjs;
  final String email;
  final String password;

  UserRemaja({
    required this.uid,
    required this.name,
    required this.nik,
    required this.sex,
    required this.birthDate,
    required this.address,
    required this.bpjs,
    required this.email,
    required this.password,
  });
}
