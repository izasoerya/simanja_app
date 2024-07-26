import 'package:simanja_app/utils/enums.dart';

class UserRemaja {
  final String uid;
  final String name;
  final String nik;
  final String posyandu;
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
    required this.posyandu,
    required this.sex,
    required this.birthDate,
    required this.address,
    required this.bpjs,
    required this.email,
    required this.password,
  });

  UserRemaja copyWith({
    String? uid,
    String? name,
    String? nik,
    String? posyandu,
    Gender? sex,
    DateTime? birthDate,
    String? address,
    bool? bpjs,
    String? email,
    String? password,
  }) {
    return UserRemaja(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      nik: nik ?? this.nik,
      posyandu: posyandu ?? this.posyandu,
      sex: sex ?? this.sex,
      birthDate: birthDate ?? this.birthDate,
      address: address ?? this.address,
      bpjs: bpjs ?? this.bpjs,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
