class OrganizerEntity {
  final String? name;
  final String? picture;
  final int? numberOfFollowing;
  final int? numberOfFollowers;
  final String? about;
  final List<EventEntity>? events;
  final List<ReviewEntity>? reviews;

  const OrganizerEntity({
    this.name,
    this.picture,
    this.numberOfFollowing,
    this.numberOfFollowers,
    this.about,
    this.events,
    this.reviews,
  });
}

class EventEntity {
  final int? id;
  final String? picture;
  final String? date;
  final String? title;

  const EventEntity({
    this.id,
    this.picture,
    this.date,
    this.title,
  });
}

class ReviewEntity {
  final int? reviewId;
  final String? reviewerPicture;
  final String? reviewerName;
  final int? rate;
  final String? review;
  final String? reviewDate;

  const ReviewEntity({
    this.reviewId,
    this.reviewerPicture,
    this.reviewerName,
    this.rate,
    this.review,
    this.reviewDate,
  });
}
