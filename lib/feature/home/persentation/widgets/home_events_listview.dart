import 'package:bookingapp/core/helpers/app_const.dart';
import 'package:bookingapp/core/helpers/app_spacing.dart';
import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/helpers/functions.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/core/widgets/app_cach_image.dart';
import 'package:bookingapp/feature/events/domain/entity/events_entity.dart';
import 'package:bookingapp/feature/events/persentation/controller/events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

class HomeEventsList extends StatefulWidget {
  const HomeEventsList({super.key});

  @override
  State<HomeEventsList> createState() => _HomeEventsListState();
}

class _HomeEventsListState extends State<HomeEventsList> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    EventsCubit.of(context).getEvents();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        EventsCubit.of(context).getEvents(isPagination: true);
      }
    });
  }

  final Box<EventsEntity> bookmarkedBox = Hive.box<EventsEntity>(
    AppSavedKey.savedEvents,
  );
  Future<void> toggleBookmark(EventsEntity event) async {
    if (bookmarkedBox.containsKey(event.eventId)) {
      await bookmarkedBox.delete(event.eventId);
    } else {
      await bookmarkedBox.put(event.eventId, event);
    }

    setState(() {});
  }

  bool isBookmarked(int eventId) {
    return bookmarkedBox.containsKey(eventId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsCubit, EventsState>(
      buildWhen:
          (previous, current) =>
              current is EventsLoading ||
              current is EventsError ||
              current is EventsSuccess ||
              current is NoInternet ||
              current is saveEvent,
      builder: (context, state) {
        var cubit = EventsCubit.of(context);
        var eventsList = cubit.eventsList;
        if (state is EventsLoading) {
          return SizedBox(
            height: AppHight.fullHight(context) * .35,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is EventsError) {
          return SizedBox(
            height: AppHight.fullHight(context) * .35,
            child: Center(child: Text(state.error)),
          );
        }
        if (state is NoInternet) {
          return SizedBox(
            height: AppHight.fullHight(context) * .35,
            child: Center(
              child: Text('check Intenet connection and try again'),
            ),
          );
        } else {
          return SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(eventsList.length, (index) {
                return GestureDetector(
                  onLongPress: () {
                    EventsCubit.of(
                      context,
                    ).shareEventWithImage(eventsList[index]);
                  },

                  onTap: () {
                    AppNavigator.pushNamed(
                      context,
                      AppRoutes.eventsDeatilsScreen,
                      params: {"id": eventsList[index].eventId.toString()},
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: AppPadding.p16),
                    child: Container(
                      margin: EdgeInsets.all(4.sp),
                      padding: EdgeInsets.all(AppPadding.p10),
                      decoration: BoxDecoration(
                        color: ColorsManager.white,
                        borderRadius: BorderRadius.circular(AppRadius.r12),
                        boxShadow: [
                          BoxShadow(
                            color: ColorsManager.greyColor.withOpacity(0.1),
                            spreadRadius: 0.3,
                            blurRadius: 30,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      width: AppWidth.fullWidth(context) * .7,

                      child: Column(
                        spacing: AppHight.h3,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              AppCacheImage(
                                width: AppWidth.fullWidth(context),
                                height: AppHight.fullHight(context) * .2,
                                image: eventsList[index].picture,
                                isNotCircle: true,
                              ),

                              Padding(
                                padding: EdgeInsets.all(AppPadding.p8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: AppHight.fullHight(context) * .11,
                                      padding: EdgeInsets.all(AppPadding.p8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        color: ColorsManager.lightPink,
                                      ),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                AppHeleperFunctions.formatEventDate(
                                                  eventsList[index].date,
                                                  format: 'd MMMM',
                                                ).split(" ")[0],
                                                style: TextStyles.font18Bold
                                                    .copyWith(
                                                      color: ColorsManager.pink,
                                                    ),
                                              ),
                                              Text(
                                                AppHeleperFunctions.formatEventDate(
                                                  eventsList[index].date,
                                                  format: 'd MMMM',
                                                ).split(" ")[1],
                                                style: TextStyles.font18Bold
                                                    .copyWith(
                                                      color: ColorsManager.pink,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await toggleBookmark(eventsList[index]);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(AppPadding.p8),
                                        height:
                                            AppHight.fullHight(context) * .07,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                          color: ColorsManager.lightPink,
                                        ),
                                        child: Icon(
                                          isBookmarked(
                                                eventsList[index].eventId,
                                              )
                                              ? Icons.bookmark
                                              : Icons.bookmark_border,
                                          size: 24.sp,
                                          color: ColorsManager.pink,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          AppSpace.vertical(AppHight.h6),
                          Text(
                            eventsList[index].title,
                            style: TextStyles.font18Medium.copyWith(
                              color: ColorsManager.black,
                            ),
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            spacing: AppWidth.w10,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  AppNavigator.pushNamed(
                                    context,
                                    AppRoutes.organizerScreen,
                                    params: {
                                      "id":
                                          eventsList[index].organizer.id
                                              .toString(),
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  radius: AppRadius.r14,
                                  backgroundImage: NetworkImage(
                                    eventsList[index].organizer.picture,
                                  ),
                                ),
                              ),
                              Text(
                                '${eventsList[index].numberOfGoing} Going',
                                style: TextStyles.font12Medium.copyWith(
                                  color: ColorsManager.mainColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: AppWidth.w10,
                            children: [
                              SvgPicture.asset(AppImages.location),
                              Expanded(
                                child: Text(
                                  eventsList[index].address,
                                  style: TextStyles.font14Regular.copyWith(
                                    color: ColorsManager.greyColor,
                                  ),
                                  softWrap: true,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        }
      },
    );
  }
}
