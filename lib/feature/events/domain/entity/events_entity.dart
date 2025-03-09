import 'package:hive/hive.dart';

part 'events_entity.g.dart';

@HiveType(typeId: 0)
class EventsEntity extends HiveObject {
  @HiveField(0)
  final int eventId;

  @HiveField(1)
  final String picture;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final String address;

  @HiveField(5)
  final int numberOfGoing;

  @HiveField(6)
  final OrganizerEntity organizer;

  EventsEntity({
    required this.eventId,
    required this.picture,
    required this.date,
    required this.title,
    required this.address,
    required this.numberOfGoing,
    required this.organizer,
  });
}

@HiveType(typeId: 1)
class OrganizerEntity extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String picture;

  OrganizerEntity({
    required this.id,
    required this.name,
    required this.picture,
  });
}
