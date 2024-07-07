class EventKader {
  final String id;
  final String location;
  final DateTime date;
  final String event;
  // TODO: ADD ENUM THEME EVENT
  final String note;
  final int totalKader;
  final String visitor;
  final String urlImage;

  EventKader({
    required this.id,
    required this.location,
    required this.date,
    required this.event,
    // TODO: ADD ENUM THEME EVENT
    required this.note,
    required this.totalKader,
    required this.visitor,
    required this.urlImage,
  });
}
