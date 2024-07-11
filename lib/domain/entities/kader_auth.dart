import 'package:simanja_app/utils/enums.dart';

class UserKader {
  final String uid;
  final String name;
  final String nik;
  final Gender sex;
  final DateTime birthDate;
  final String address;
  final bool bpjs;
  final String email;
  final String password;

  UserKader({
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

  UserKader copyWith({
    String? uid,
    String? name,
    String? nik,
    Gender? sex,
    DateTime? birthDate,
    String? address,
    bool? bpjs,
    String? email,
    String? password,
  }) {
    return UserKader(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      nik: nik ?? this.nik,
      sex: sex ?? this.sex,
      birthDate: birthDate ?? this.birthDate,
      address: address ?? this.address,
      bpjs: bpjs ?? this.bpjs,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
