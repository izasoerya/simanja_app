import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/domain/repositories/kader_event_repo.dart';

class KaderEventImplementation implements KaderEventRepo {
  @override
  Future<void> createKaderEvent(EventKader kaderEvent) {
    // TODO: implement createKaderEvent
    throw UnimplementedError();
  }

  @override
  Future<void> deleteKaderEvent(EventKader kaderEvent) {
    // TODO: implement deleteKaderEvent
    throw UnimplementedError();
  }

  @override
  Future<EventKader> getKaderEventById(String id) {
    // TODO: implement getKaderEventById
    throw UnimplementedError();
  }

  @override
  Future<List<EventKader>> getKaderEvents() {
    // TODO: implement getKaderEvents
    throw UnimplementedError();
  }

  @override
  Future<void> updateKaderEvent(EventKader kaderEvent) {
    // TODO: implement updateKaderEvent
    throw UnimplementedError();
  }
}
