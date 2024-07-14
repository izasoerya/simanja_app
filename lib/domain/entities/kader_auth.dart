class UserKader {
  final String uid;
  final String nameAccount;
  final String namePosyandu;
  final String keyPosyandu;
  final DateTime birthDate;
  final String address;
  final String email;
  final String password;

  UserKader({
    required this.uid,
    required this.nameAccount,
    required this.namePosyandu,
    required this.keyPosyandu,
    required this.birthDate,
    required this.address,
    required this.email,
    required this.password,
  });

  UserKader copyWith({
    String? uid,
    String? nameAccount,
    String? namePosyandu,
    String? keyPosyandu,
    DateTime? birthDate,
    String? address,
    String? email,
    String? password,
  }) {
    return UserKader(
      uid: uid ?? this.uid,
      nameAccount: nameAccount ?? this.nameAccount,
      namePosyandu: namePosyandu ?? this.namePosyandu,
      keyPosyandu: keyPosyandu ?? this.keyPosyandu,
      birthDate: birthDate ?? this.birthDate,
      address: address ?? this.address,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'UserKader(uid: $uid, nameKader: $nameAccount, namePosyandu: $namePosyandu, nik: $keyPosyandu, birthDate: $birthDate, address: $address, email: $email, password: $password)';
  }
}
