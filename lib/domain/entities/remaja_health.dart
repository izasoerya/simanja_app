class HealthPropertiesRemaja {
  String? uid;
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
      uidRemaja: json['uid_remaja'],
      weight: json['weight'],
      height: json['height'],
      armCircumference: json['arm_radius'],
      abdominalCircumference: json['abdominal_radius'],
      hemoglobin: json['hemoglobin'],
      cholesterol: json['cholesterol'],
      bloodSugar: json['blood_sugar'],
      tds: json['tds'],
      tdd: json['tdd'],
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
