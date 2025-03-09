import 'package:bookingapp/feature/events/domain/entity/events_entity.dart';

class EventsModel {
  final bool success;
  final String message;
  final EventsDataModel data;

  EventsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: EventsDataModel.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data.toJson()};
  }
}

class EventsDataModel {
  final int currentPage;
  final int pageSize;
  final int totalItems;
  final int totalPages;
  final List<EventsResponseModel> events;

  EventsDataModel({
    required this.currentPage,
    required this.pageSize,
    required this.totalItems,
    required this.totalPages,
    required this.events,
  });

factory EventsDataModel.fromJson(Map<String, dynamic> json) {
  print("Decoding EventsDataModel: $json");

  // Handle both API response and cached format.
  final data = json.containsKey("data") ? json["data"] : json;

  return EventsDataModel(
    currentPage: data['current_page'] ?? 0,
    pageSize: data['page_size'] ?? 0,
    totalItems: data['total_items'] ?? 0,
    totalPages: data['total_pages'] ?? 0,
    events: (data['events'] as List<dynamic>?)
        ?.map((event) => EventsResponseModel.fromJson(event))
        .toList() ?? [],
  );
}


  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'page_size': pageSize,
      'total_items': totalItems,
      'total_pages': totalPages,
      'events': events.map((event) => event.toJson()).toList(),
    };
  }

  List<EventsEntity> toEntity() {
    return events.map((event) {
      return event.toEntity();
    }).toList();
  }
}

class EventsResponseModel {
  final int eventId;
  final String picture;
  final String date;
  final String title;
  final String address;
  final int numberOfGoing;
  final OrganizerModel organizer;

  EventsResponseModel({
    required this.eventId,
    required this.picture,
    required this.date,
    required this.title,
    required this.address,
    required this.numberOfGoing,
    required this.organizer,
  });

  factory EventsResponseModel.fromJson(Map<String, dynamic> json) {
    return EventsResponseModel(
      eventId: json['event_id'] ?? 0,
      picture: json['picture'] ?? '',
      date: json['date'] ?? '',
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      numberOfGoing: json['number_of_going'] ?? 0,
      organizer: OrganizerModel.fromJson(json['organizer'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'picture': picture,
      'date': date,
      'title': title,
      'address': address,
      'number_of_going': numberOfGoing,
      'organizer': organizer.toJson(),
    };
  }


  EventsEntity toEntity() {
    return EventsEntity(
      eventId: eventId,
      picture: picture,
      date: date,
      title: title,
      address: address,
      numberOfGoing: numberOfGoing,
      organizer: organizer.toEntity(),
    );
  }
}

class OrganizerModel {
  final int id;
  final String name;
  final String picture;

  OrganizerModel({required this.id, required this.name, required this.picture});

  factory OrganizerModel.fromJson(Map<String, dynamic> json) {
    return OrganizerModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      picture: json['picture'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'picture': picture};
  }

  OrganizerEntity toEntity() {
    return OrganizerEntity(id: id, name: name, picture: picture);
  }
}
