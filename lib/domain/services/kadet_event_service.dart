import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/infrastructure/ikader_event.dart';

class KaderEventService {
  Future<EventKader?> createEvent(EventKader event) async {
    final response = await KaderEventImplementation().createKaderEvent(event);
    if (response == null) return null;
    return response;
  }

  Future<EventKader?> getEvent(String idEvent) async {
    final response =
        await KaderEventImplementation().getKaderEventById(idEvent);
    if (response != null) return response;
    return null;
  }

  Future<List<EventKader>> getEventList(String idKader) async {
    final response = await KaderEventImplementation().getKaderEvents(idKader);
    return response;
  }

  Future<List<EventKader>> getActiveEventList(String idKader) async {
    final response = await KaderEventImplementation().getKaderEvents(idKader);
    return response.where((element) => element.isFinish == false).toList();
  }

  Future<List<EventKader>> getDeactiveEventList(String idKader) async {
    final response = await KaderEventImplementation().getKaderEvents(idKader);
    return response.where((element) => element.isFinish == true).toList();
  }

  Future<EventKader?> updateEvent(EventKader event) async {
    final response = await KaderEventImplementation().updateKaderEvent(event);
    return response;
  }

  Future<EventKader?> updateProfilePicture(EventKader event) async {
    final response =
        await KaderEventImplementation().updateProfilePicture(event);
    return response;
  }

  Future<bool> deleteEvent(EventKader event) async {
    final res = await KaderEventImplementation().deleteKaderEvent(event);
    return res == null;
  }
}
