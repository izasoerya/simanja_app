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

  factory UserRemaja.fromJSON(Map<String, dynamic> json) {
    return UserRemaja(
      uid: json['uid'],
      name: json['name'],
      nik: json['nik'],
      posyandu: json['posyandu'],
      sex: json['is_male'] == true ? Gender.male : Gender.female,
      birthDate: DateTime.parse(json['date_of_birth']),
      address: json['address'],
      bpjs: json['is_bpjs'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'name': name,
      'nik': nik,
      'posyandu': posyandu,
      'is_male': sex == Gender.male ? true : false,
      'date_of_birth': birthDate.toIso8601String(),
      'address': address,
      'is_bpjs': bpjs,
      'email': email,
      'password': password,
    };
  }
}
