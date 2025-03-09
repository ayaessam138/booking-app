import 'package:bookingapp/core/helpers/app_const.dart';
import 'package:bookingapp/core/helpers/app_spacing.dart';
import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/feature/bottom_nav_bar/persentation/controller/bottom_nav_bar_cubit.dart';
import 'package:bookingapp/feature/events/domain/entity/events_entity.dart'
    show EventsEntity;
import 'package:bookingapp/feature/events/persentation/widgets/events_listview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive/hive.dart';

class SavedEventsScreen extends StatefulWidget {
  const SavedEventsScreen({super.key});

  @override
  State<SavedEventsScreen> createState() => _SavedEventsScreenState();
}

class _SavedEventsScreenState extends State<SavedEventsScreen> {
  final Box<EventsEntity> bookmarkedBox = Hive.box<EventsEntity>(
    AppSavedKey.savedEvents,
  );

  @override
  Widget build(BuildContext context) {
    var savedEvents = bookmarkedBox.values.toList();

    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    spacing: AppWidth.w6,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (BottomNavBarCubit.get.currentIndex == 1) {
                            BottomNavBarCubit.get.changeIndex(0);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          size: 24.sp,
                          color: ColorsManager.black,
                        ),
                      ),
                      Text("Events", style: TextStyles.font24Regular),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 24.sp,
                          color: ColorsManager.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert_sharp,
                          size: 24.sp,
                          color: ColorsManager.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppSpace.vertical(AppHight.h12),
              Expanded(child:savedEvents.isEmpty
              ? Center(child: Text("No saved events"))
              : ListView.separated(
                shrinkWrap: true,
                itemCount: savedEvents.length,
                itemBuilder: (context, index) {
                  final event = savedEvents[index];
                  return EventsListviewCard(eventsEntity: event, onTap: (){
              
                     AppNavigator.pushNamed(
                      context,
                      AppRoutes.eventsDeatilsScreen,
                      params: {
                        "id": event.eventId.toString(),
                      },
                    );
                  });
                }, separatorBuilder: (BuildContext context, int index) { return AppSpace.vertical(AppHight.h12); },
              ),),
            ],
          ),
        ),
      ),
          
    );
  }
}
