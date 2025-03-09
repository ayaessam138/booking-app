// ignore_for_file: unnecessary_this

import 'package:bookingapp/feature/events/data/models/events_model.dart';
import 'package:bookingapp/feature/events/domain/entity/events_deatils_entity.dart';

class EventDetailsModel {
  bool? success;
  String? message;
  EventDeatilsDataModel? data;

  EventDetailsModel({this.success, this.message, this.data});

  EventDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data =
        json['data'] != null
            ? new EventDeatilsDataModel.fromJson(json['data'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class EventDeatilsDataModel {
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
  OrganizerModel? organizer;

  EventDeatilsDataModel({
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

  EventDeatilsDataModel.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    picture = json['picture'];
    date = json['date'];
    title = json['title'];
    address = json['address'];
    numberOfGoing = json['number_of_going'];
    addressTitle = json['address_title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    aboutEvent = json['about_event'];
    eventPrice = json['event_price'];
    organizer =
        json['organizer'] != null
            ? new OrganizerModel.fromJson(json['organizer'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['event_id'] = this.eventId;
    data['picture'] = this.picture;
    data['date'] = this.date;
    data['title'] = this.title;
    data['address'] = this.address;
    data['number_of_going'] = this.numberOfGoing;
    data['address_title'] = this.addressTitle;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['about_event'] = this.aboutEvent;
    data['event_price'] = this.eventPrice;
    if (this.organizer != null) {
      data['organizer'] = this.organizer!.toJson();
    }
    return data;
  }

  EventDeatilsEntity toEntity() {
    return EventDeatilsEntity(
      eventId: eventId,
      picture: picture,
      date: date,
      title: title,
      address: address,
      numberOfGoing: numberOfGoing,
      addressTitle: addressTitle,
      latitude: latitude,
      longitude: longitude,
      aboutEvent: aboutEvent,
      eventPrice: eventPrice,
      organizer: organizer?.toEntity(),
    );
  }
}
