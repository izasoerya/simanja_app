class EventKader {
  final String id;
  final String idKader;
  final String name;
  final String description;
  final String location;
  final DateTime date;
  final String theme;
  final String topic;
  final String note;
  final String totalKader;
  final String visitor;
  final String urlImage;
  final bool isFinish;

  EventKader({
    required this.id,
    required this.idKader,
    required this.name,
    required this.description,
    required this.location,
    required this.date,
    required this.theme,
    required this.topic,
    required this.note,
    required this.totalKader,
    required this.visitor,
    required this.urlImage,
    this.isFinish = false,
  });

  EventKader copyWith({
    String? id,
    String? idKader,
    String? name,
    String? description,
    String? location,
    DateTime? date,
    String? theme,
    String? topic,
    String? note,
    String? totalKader,
    String? visitor,
    String? urlImage,
    bool? isFinish,
  }) {
    return EventKader(
      id: id ?? this.id,
      idKader: idKader ?? this.idKader,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,
      date: date ?? this.date,
      theme: theme ?? this.theme,
      topic: topic ?? this.topic,
      note: note ?? this.note,
      totalKader: totalKader ?? this.totalKader,
      visitor: visitor ?? this.visitor,
      urlImage: urlImage ?? this.urlImage,
      isFinish: isFinish ?? this.isFinish,
    );
  }

  factory EventKader.fromJSON(Map<String, dynamic> json) {
    return EventKader(
      id: json['uid'],
      idKader: json['uid_kader'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      date: DateTime.parse(json['date']),
      theme: json['theme'],
      topic: json['topic'],
      note: json['note'],
      totalKader: json['kader_count'],
      visitor: json['visitor'],
      urlImage: json['url_image'],
      isFinish: json['is_finish'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid': id,
      'uid_kader': idKader,
      'name': name,
      'description': description,
      'location': location,
      'date': date.toIso8601String(),
      'theme': theme,
      'topic': topic,
      'note': note,
      'kader_count': totalKader,
      'visitor': visitor,
      'url_image': urlImage,
      'is_finish': isFinish,
    };
  }
}
