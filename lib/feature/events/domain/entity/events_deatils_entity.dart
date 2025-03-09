import 'package:bookingapp/feature/events/domain/entity/events_entity.dart';

class EventDeatilsEntity {
  int? eventId;
  String? picture;
  String? date;
  String? title;
  String? address;
  int? numberOfGoing;
  String? addressTitle;
  String? latitude;
  String? longitude;
  String? aboutEvent;
  String? eventPrice;
  OrganizerEntity? organizer;

  EventDeatilsEntity({
    this.eventId,
    this.picture,
    this.date,
    this.title,
    this.address,
    this.numberOfGoing,
    this.addressTitle,
    this.latitude,
    this.longitude,
    this.aboutEvent,
    this.eventPrice,
    this.organizer,
  });
}
