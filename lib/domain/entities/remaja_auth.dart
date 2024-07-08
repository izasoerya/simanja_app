import 'package:simanja_app/utils/enums.dart';

class UserRemaja {
  final String? uid;
  final String? name;
  final String? nik;
  final Gender? sex;
  final DateTime? birthDate;
  final String? address;
  final bool? bpjs;
  final String? email;
  final String? password;

  UserRemaja({
    this.uid,
    this.name,
    this.nik,
    this.sex,
    this.birthDate,
    this.address,
    this.bpjs,
    this.email,
    this.password,
  });
}
