class HealthPropertiesRemaja {
  String? uid;
  String? uidCheckup;
  String? uidRemaja;
  double? weight;
  double? height;
  double? armCircumference;
  double? abdominalCircumference;
  String? get bloodPressure => '$tds/$tdd mmHg';
  double? hemoglobin;
  double? cholesterol;
  double? bloodSugar;
  double? tds;
  double? tdd;
  DateTime? checkedAt;
  bool? kek;
  bool? anemia;
  bool? smoker;
  bool? tablet;
  String? note;

  HealthPropertiesRemaja({
    this.uid,
    this.uidCheckup,
    this.uidRemaja,
    this.weight,
    this.height,
    this.armCircumference,
    this.abdominalCircumference,
    this.hemoglobin,
    this.cholesterol,
    this.bloodSugar,
    this.tds,
    this.tdd,
    this.checkedAt,
    this.kek,
    this.anemia,
    this.smoker,
    this.tablet,
    this.note,
  });

  HealthPropertiesRemaja copyWith({
    String? uid,
    String? uidCheckup,
    String? uidRemaja,
    double? weight,
    double? height,
    double? armCircumference,
    double? abdominalCircumference,
    String? bloodPressure,
    double? hemoglobin,
    double? cholesterol,
    double? bloodSugar,
    double? tds,
    double? tdd,
    DateTime? checkedAt,
    bool? kek,
    bool? anemia,
    bool? smoker,
    bool? tablet,
    String? note,
  }) {
    return HealthPropertiesRemaja(
      uid: uid ?? this.uid,
      uidCheckup: uidCheckup ?? this.uidCheckup,
      uidRemaja: uidRemaja ?? this.uidRemaja,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      armCircumference: armCircumference ?? this.armCircumference,
      abdominalCircumference:
          abdominalCircumference ?? this.abdominalCircumference,
      hemoglobin: hemoglobin ?? this.hemoglobin,
      cholesterol: cholesterol ?? this.cholesterol,
      bloodSugar: bloodSugar ?? this.bloodSugar,
      tds: tds ?? this.tds,
      tdd: tdd ?? this.tdd,
      checkedAt: checkedAt ?? this.checkedAt,
      kek: kek ?? this.kek,
      anemia: anemia ?? this.anemia,
      smoker: smoker ?? this.smoker,
      tablet: tablet ?? this.tablet,
      note: note ?? this.note,
    );
  }

  factory HealthPropertiesRemaja.fromJSON(Map<String, dynamic> json) {
    return HealthPropertiesRemaja(
      uid: json['uid'],
      uidCheckup: json['checkup_uid'],
      uidRemaja: json['uid_remaja'],
      weight: double.parse(json['weight'].toString()),
      height: double.parse(json['height'].toString()),
      armCircumference: double.parse(json['arm_radius'].toString()),
      abdominalCircumference: double.parse(json['abdominal_radius'].toString()),
      hemoglobin: double.parse(json['hemoglobin'].toString()),
      cholesterol: double.parse(json['cholesterol'].toString()),
      bloodSugar: double.parse(json['blood_sugar'].toString()),
      tds: double.parse(json['tds'].toString()),
      tdd: double.parse(json['tdd'].toString()),
      checkedAt: DateTime.parse(json['checked_at']),
      kek: json['status_kek'],
      anemia: json['status_anemia'],
      smoker: json['status_smoker'],
      tablet: json['status_tablet'],
      note: json['doctor_note'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'checkup_uid': uidCheckup,
      'uid_remaja': uidRemaja,
      'weight': weight,
      'height': height,
      'arm_radius': armCircumference,
      'abdominal_radius': abdominalCircumference,
      'blood_pressure': bloodPressure,
      'hemoglobin': hemoglobin,
      'cholesterol': cholesterol,
      'blood_sugar': bloodSugar,
      'tds': tds,
      'tdd': tdd,
      'checked_at': checkedAt!.toIso8601String(),
      'status_kek': kek,
      'status_anemia': anemia,
      'status_smoker': smoker,
      'status_tablet': tablet,
      'doctor_note': note,
    };
  }
}
