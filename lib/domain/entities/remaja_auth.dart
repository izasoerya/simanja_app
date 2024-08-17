import 'package:simanja_app/utils/date_formatter.dart';
import 'package:simanja_app/utils/enums.dart';

class UserRemaja {
  final String uid;
  final String name;
  final String nik;
  final String posyandu;
  final Gender sex;
  final DateTime birthDate;
  int? get age => DateFormatter().calculateAgeInMonths(birthDate);
  final String phoneNumber;
  final String street;
  final int streetNumber;
  final int rt;
  final int rw;
  final String village;
  final String district;
  final bool smoker;
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
    required this.phoneNumber,
    required this.street,
    required this.streetNumber,
    required this.rt,
    required this.rw,
    required this.village,
    required this.district,
    required this.smoker,
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
    String? phoneNumber,
    String? street,
    int? streetNumber,
    int? rt,
    int? rw,
    String? village,
    String? district,
    bool? smoker,
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
      phoneNumber: phoneNumber ?? this.phoneNumber,
      street: street ?? this.street,
      streetNumber: streetNumber ?? this.streetNumber,
      rt: rt ?? this.rt,
      rw: rw ?? this.rw,
      village: village ?? this.village,
      district: district ?? this.district,
      smoker: smoker ?? this.smoker,
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
      sex: json['is_male'] ? Gender.male : Gender.female,
      birthDate: DateTime.parse(json['date_of_birth']),
      phoneNumber: json['phone_number'],
      street: json['street'],
      streetNumber: json['street_number'],
      rt: json['rt'],
      rw: json['rw'],
      village: json['village'],
      district: json['district'],
      smoker: json['is_smoker'],
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
      'phone_number': phoneNumber,
      'street': street,
      'street_number': streetNumber,
      'rt': rt,
      'rw': rw,
      'village': village,
      'district': district,
      'is_smoker': smoker,
      'is_bpjs': bpjs,
      'email': email,
      'password': password,
    };
  }
}
