import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/helpers/functions.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/core/widgets/app_cach_image.dart';
import 'package:bookingapp/feature/events/domain/entity/events_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventsListviewCard extends StatelessWidget {
  final EventsEntity eventsEntity;
  final void Function() onTap;

  const EventsListviewCard({
    super.key,
    required this.eventsEntity,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: AppWidth.w16,
        children: [
          AppCacheImage(
            image: eventsEntity.picture,
            isNotCircle: true,
            height: AppHight.fullHight(context) * .15,
            width: AppWidth.fullWidth(context) * .35,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  AppHeleperFunctions.formatEventDate(eventsEntity.date),
                  style: TextStyles.font14Regular.copyWith(
                    color: ColorsManager.mainColor,
                  ),
                ),
                Text(
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  eventsEntity.title,
                  style: TextStyles.font16Regular.copyWith(
                    color: ColorsManager.black,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.location),
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        eventsEntity.address,
                        style: TextStyles.font14Regular.copyWith(
                          color: ColorsManager.greyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
