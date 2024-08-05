import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/infrastructure/ikader_event.dart';

class KaderEventService {
  Future<EventKader?> createEvent(EventKader event) async {
    final response = await KaderEventImplementation().createKaderEvent(event);
    if (response == null) return null;
    return response;
  }

  Future<void> updateEvent() async {
    // Update event
  }

  Future<void> deleteEvent() async {
    // Delete event
  }
}
