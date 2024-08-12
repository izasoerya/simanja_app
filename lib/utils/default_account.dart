import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/utils/enums.dart';

UserKader kaderAccount = UserKader(
  uid: 'dummy',
  nameAccount: 'dummy',
  namePosyandu: 'dummy',
  keyPosyandu: 'dummy',
  birthDate: DateTime.now(),
  address: 'dummy',
  email: 'dummy',
  password: 'dummy',
);

UserRemaja remajaAccount = UserRemaja(
  uid: 'dummy',
  name: 'dummy',
  posyandu: 'dummy',
  birthDate: DateTime.now(),
  phoneNumber: 'dummy',
  street: 'dummy',
  streetNumber: 0,
  rt: 0,
  rw: 0,
  village: 'dummy',
  district: 'dummy',
  smoker: false,
  email: 'dummy',
  password: 'dummy',
  nik: '',
  bpjs: false,
  sex: Gender.male,
);
