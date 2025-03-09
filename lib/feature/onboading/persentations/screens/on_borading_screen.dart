import 'package:bookingapp/core/helpers/app_const.dart';
import 'package:bookingapp/core/helpers/app_spacing.dart';
import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/localstorage/app_local_storage.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/feature/onboading/persentations/screens/first_onboarding.dart';
import 'package:bookingapp/feature/onboading/persentations/screens/second_onborading.dart';
import 'package:bookingapp/feature/onboading/persentations/widgets/on_bording_contanier.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({super.key});

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  int index = 0;
  PageController controller = PageController();
  void goToNextPage() {
    if (index < 2) {
      controller.animateToPage(
        index + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear,
      );
    }
    if (index == 2) {
      AppHiveLocalStorage.saveBool(
        AppSavedKey.onBorading,
        true,
        Hive.box(AppSavedKey.intialRoute),
      );
      AppNavigator.go(context, AppRoutes.loginScreen);
    }
  }

  void skipOnBoarding() {
    AppNavigator.go(context, AppRoutes.loginScreen);
    AppHiveLocalStorage.saveBool(
      AppSavedKey.onBorading,
      true,
      Hive.box(AppSavedKey.intialRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppSpace.vertical(AppHight.h24),
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: controller,
              children: [
                FirstOnboarding(),
                SecondOnborading(),
                FirstOnboarding(),
              ],
            ),
          ),
          index == 0
              ? OnBordingContanier(
                firstLabel: " Explore Upcoming and  ",
                secondLabel: "Nearby Events",
                thirdLabel: "In publishing and graphic design, Lorem is",
                fourthLabel: 'a placeholder text commonly',
                onPressedSkip: skipOnBoarding,
                onPressedNext: goToNextPage,
                index: 0,
              )
              : index == 1
              ? OnBordingContanier(
                firstLabel: "Web Have Modern Events ",
                secondLabel: "Calendar Feature ",
                thirdLabel: "In publishing and graphic design, Lorem i",
                fourthLabel: 'a placeholder text commonly',
                onPressedSkip: skipOnBoarding,
                onPressedNext: goToNextPage,
                index: 1,
              )
              : OnBordingContanier(
                firstLabel: "  To Look Up More Events or ",
                secondLabel: "Activities Nearby By Map",
                thirdLabel: "In publishing and graphic design, Lorem i",
                fourthLabel: 'a placeholder text commonly',
                onPressedSkip: skipOnBoarding,
                onPressedNext: goToNextPage,
                index: 2,
              ),
        ],
      ),
    );
  }
}
