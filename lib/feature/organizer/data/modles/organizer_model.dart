import 'package:bookingapp/feature/organizer/domain/entity/organizer_entity.dart';

class OrganizerModel {
  final bool success;
  final String message;
  final OrganizerDataModel data;

  OrganizerModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OrganizerModel.fromJson(Map<String, dynamic> json) {
    return OrganizerModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: OrganizerDataModel.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }

  OrganizerEntity toEntity() {
    return OrganizerEntity(
      name: data.name ?? '',
      picture: data.picture ?? '',
      numberOfFollowing: data.numberOfFollowing ?? 0,
      numberOfFollowers: data.numberOfFollowers ?? 0,
      about: data.about ?? '',
      events: data.events?.map((e) => e.toEntity()).toList() ?? [],
      reviews: data.reviews?.map((r) => r.toEntity()).toList() ?? [],
    );
  }
}

class OrganizerDataModel {
  final String? name;
  final String? picture;
  final int? numberOfFollowing;
  final int? numberOfFollowers;
  final String? about;
  final List<Events>? events;
  final List<Reviews>? reviews;

  OrganizerDataModel({
    this.name,
    this.picture,
    this.numberOfFollowing,
    this.numberOfFollowers,
    this.about,
    this.events,
    this.reviews,
  });

  factory OrganizerDataModel.fromJson(Map<String, dynamic> json) {
    return OrganizerDataModel(
      name: json['name'],
      picture: json['picture'],
      numberOfFollowing: json['number_of_following'],
      numberOfFollowers: json['number_of_followers'],
      about: json['about'],
      events: (json['events'] as List?)?.map((e) => Events.fromJson(e)).toList(),
      reviews: (json['reviews'] as List?)?.map((r) => Reviews.fromJson(r)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'picture': picture,
      'number_of_following': numberOfFollowing,
      'number_of_followers': numberOfFollowers,
      'about': about,
      'events': events?.map((e) => e.toJson()).toList(),
      'reviews': reviews?.map((r) => r.toJson()).toList(),
    };
  }
}

class Events {
  final int? id;
  final String? picture;
  final String? date;
  final String? title;

  Events({this.id, this.picture, this.date, this.title});

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      id: json['id'],
      picture: json['picture'],
      date: json['date'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'picture': picture,
      'date': date,
      'title': title,
    };
  }

  EventEntity toEntity() {
    return EventEntity(
      id: id ?? 0,
      picture: picture ?? '',
      date: date ?? '',
      title: title ?? '',
    );
  }
}

class Reviews {
  final int? reviewId;
  final String? reviewerPicture;
  final String? reviewerName;
  final int? rate;
  final String? review;
  final String? reviewDate;

  Reviews({
    this.reviewId,
    this.reviewerPicture,
    this.reviewerName,
    this.rate,
    this.review,
    this.reviewDate,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      reviewId: json['review_id'],
      reviewerPicture: json['reviewer_picture'],
      reviewerName: json['reviewer_name'],
      rate: json['rate'],
      review: json['review'],
      reviewDate: json['review_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'review_id': reviewId,
      'reviewer_picture': reviewerPicture,
      'reviewer_name': reviewerName,
      'rate': rate,
      'review': review,
      'review_date': reviewDate,
    };
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      reviewId: reviewId ?? 0,
      reviewerPicture: reviewerPicture ?? '',
      reviewerName: reviewerName ?? '',
      rate: rate ?? 0,
      review: review ?? '',
      reviewDate: reviewDate ?? '',
    );
  }
}
