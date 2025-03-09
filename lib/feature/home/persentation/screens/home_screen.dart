import 'package:bookingapp/core/helpers/app_spacing.dart';
import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/feature/events/persentation/controller/events_cubit.dart';
import 'package:bookingapp/feature/home/persentation/widgets/drawer_widget.dart';
import 'package:bookingapp/feature/home/persentation/widgets/filter_contanier.dart';
import 'package:bookingapp/feature/home/persentation/widgets/home_appbar.dart';
import 'package:bookingapp/feature/home/persentation/widgets/home_events_listview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await EventsCubit.of(context).getEvents(isRefresh: true);
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: AppHight.fullHight(context) * .35,
                  child: Stack(
                    children: [
                      HomeAppbar(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      Positioned(
                        top:
                            AppHight.fullHight(context)*.27, 
                        left:
                            AppWidth.fullWidth(context)*.15, 
                        child: Row(
                          spacing: AppWidth.w16,
                          children: [
                            FilterContanier(
                              filterName: "Sports",
                              filterIcon: AppImages.sports,
                              contanierColor: ColorsManager.darkRed,
                            ),
                            FilterContanier(
                              filterName: "Music",
                              filterIcon: AppImages.music,
                              contanierColor: ColorsManager.lightBlackColor,
                            ),
                            FilterContanier(
                              filterName: "Food",
                              filterIcon: AppImages.food,
                              contanierColor: ColorsManager.minitGreenColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcoming Events",
                            style: TextStyles.font18Medium,
                          ),
                          GestureDetector(
                            onTap: () {
                              AppNavigator.push(
                                context,
                                AppRoutes.eventsScreen,
                              );
                            },
                            child: Text(
                              "See All",
                              style: TextStyles.font14Regular.copyWith(
                                color: ColorsManager.greyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
             
                      HomeEventsList(),
                      AppSpace.vertical(AppHight.h10),
                      Container(
                        width: AppWidth.fullWidth(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.r12),
                          color: ColorsManager.lightminitGreenColor,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(AppPadding.p12),
                              child: Column(
                                spacing: AppHight.h3,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Invite your friends",
                                    style: TextStyles.font18Medium,
                                  ),
                                  Text(
                                    "Get 20 for ticket",
                                    style: TextStyles.font14Regular.copyWith(
                                      color: ColorsManager.purple,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: AppHight.h14,
                                      horizontal: AppWidth.w12,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Color(0xff00F8FF),
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.r12,
                                      ),
                                    ),
                                    child: Text(
                                      "Invite",
                                      style: TextStyles.font12Regular.copyWith(
                                        color: ColorsManager.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Image.asset(AppImages.invite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
