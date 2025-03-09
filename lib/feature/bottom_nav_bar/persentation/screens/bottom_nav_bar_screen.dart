import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/feature/bottom_nav_bar/persentation/controller/bottom_nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      buildWhen: (previous, current) => current is ChangeIndexState,
      builder: (context, state) {
        var cubit = BottomNavBarCubit.get;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: cubit.pages[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeIndex(index);
            },
            currentIndex: cubit.currentIndex,
            unselectedItemColor: ColorsManager.greyColor,
            selectedItemColor: ColorsManager.mainColor,
            backgroundColor: ColorsManager.white,
            selectedLabelStyle: TextStyles.font10Bold,
            unselectedLabelStyle: TextStyles.font10Bold,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_month),
                label: "Events",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.location,
                  color:
                      cubit.currentIndex == 2
                          ? ColorsManager.mainColor
                          : ColorsManager.greyColor,
                ),
                label: "Map",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.email,
                  color:
                      cubit.currentIndex == 3
                          ? ColorsManager.mainColor
                          : ColorsManager.greyColor,
                ),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
