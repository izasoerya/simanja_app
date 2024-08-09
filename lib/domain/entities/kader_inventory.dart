class KaderInventory {
  final String uid;
  final String uidPosyandu;
  final String name;
  final String brand;
  final String type;
  final int stock;
  final DateTime dateReceive;
  final String source;
  final String note;
  final String imageURL;

  KaderInventory({
    required this.uid,
    required this.uidPosyandu,
    required this.name,
    required this.brand,
    required this.type,
    required this.stock,
    required this.dateReceive,
    required this.source,
    required this.note,
    required this.imageURL,
  });

  KaderInventory copyWith({
    String? uid,
    String? uidPosyandu,
    String? name,
    String? brand,
    String? type,
    int? stock,
    DateTime? dateReceive,
    String? source,
    String? note,
    String? imageURL,
  }) {
    return KaderInventory(
      uid: uid ?? this.uid,
      uidPosyandu: uidPosyandu ?? this.uidPosyandu,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      type: type ?? this.type,
      stock: stock ?? this.stock,
      dateReceive: dateReceive ?? this.dateReceive,
      source: source ?? this.source,
      note: note ?? this.note,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  factory KaderInventory.fromJson(Map<String, dynamic> json) {
    return KaderInventory(
      uid: json['uid'],
      uidPosyandu: json['uid_posyandu'],
      name: json['name'],
      brand: json['brand'],
      type: json['type'],
      stock: json['stock'],
      dateReceive: DateTime.parse(json['date_receive']),
      source: json['source'],
      note: json['note'],
      imageURL: json['image_url'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'uid_posyandu': uidPosyandu,
      'name': name,
      'brand': brand,
      'type': type,
      'stock': stock,
      'date_receive': dateReceive.toIso8601String(),
      'source': source,
      'note': note,
      'image_url': imageURL,
    };
  }
}
