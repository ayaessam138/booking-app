import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/helpers/functions.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/feature/events/domain/entity/events_deatils_entity.dart';
import 'package:bookingapp/feature/events/persentation/widgets/event_details_item.dart';
import 'package:flutter/material.dart';

class EventDeatailsWidget extends StatelessWidget {
  const EventDeatailsWidget({super.key, required this.eventDeatilsEntity});
  final EventDeatilsEntity eventDeatilsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      spacing: AppHight.h16,
      children: [
        EventDetailsItem(
          title: AppHeleperFunctions.formatEventDate(
            eventDeatilsEntity.date ?? "",
            format: "d MMMM, yyyy",
          ),
          subtitle: AppHeleperFunctions.formatEventDate(
            eventDeatilsEntity.date ?? "",
            format: "EEEE, h:mma",
          ),
          imageLink: AppImages.eventDate,
        ),
        EventDetailsItem(
          title: eventDeatilsEntity.address ?? '',
          subtitle: eventDeatilsEntity.addressTitle ?? '',
          imageLink: AppImages.eventLocation,
        ),
        EventDetailsItem(
          title: eventDeatilsEntity.organizer?.name ?? '',
          subtitle: "Organizer",
          imageLink: eventDeatilsEntity.organizer?.picture ?? '',
          isOrganizer: true,
        ),
      ],
    );
  }
}
