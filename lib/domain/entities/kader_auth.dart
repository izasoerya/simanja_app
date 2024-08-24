class UserKader {
  final String uid;
  final String nameAccount;
  final String namePosyandu;
  final String keyPosyandu;
  final DateTime birthDate;
  final String address;
  final String email;
  final String password;
  String? urlImage;

  UserKader({
    required this.uid,
    required this.nameAccount,
    required this.namePosyandu,
    required this.keyPosyandu,
    required this.birthDate,
    required this.address,
    required this.email,
    required this.password,
    this.urlImage,
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
    String? urlImage,
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
      urlImage: urlImage ?? this.urlImage,
    );
  }

  factory UserKader.fromJSON(Map<String, dynamic> data) {
    return UserKader(
      uid: data['uid'],
      nameAccount: data['account_name'],
      namePosyandu: data['posyandu_name'],
      keyPosyandu: data['posyandu_key'],
      birthDate: DateTime.parse(data['date_of_birth']),
      address: data['address'],
      email: data['email'],
      password: data['password'],
      urlImage: data['url_image'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'name_account': nameAccount,
      'name_posyandu': namePosyandu,
      'key_posyandu': keyPosyandu,
      'birth_date': birthDate.toIso8601String(),
      'address': address,
      'email': email,
      'password': password,
      'url_image': urlImage,
    };
  }
}
