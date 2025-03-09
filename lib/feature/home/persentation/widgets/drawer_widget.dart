import 'package:bookingapp/core/helpers/app_const.dart';
import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/localstorage/app_local_storage.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: AppWidth.fullWidth(context) * .6,
      backgroundColor: ColorsManager.white,
      child: SingleChildScrollView(
        child: SizedBox(
          height: AppHight.fullHight(context),
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p30),
            child: Column(
              spacing: 8.sp,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: AppRadius.r20,
                  backgroundImage: AssetImage(AppImages.appLogo),
                ),
                Text("Ashfak Sayem", style: TextStyles.font20Medium),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("My Profile", style: TextStyles.font16Regular),
                  leading: SvgPicture.asset(AppImages.person),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Messges", style: TextStyles.font16Regular),
                  leading: SvgPicture.asset(AppImages.personalMessages),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Calender", style: TextStyles.font16Regular),
                  leading: SvgPicture.asset(AppImages.calender),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("BookMark", style: TextStyles.font16Regular),
                  leading: SvgPicture.asset(AppImages.bookMark),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Contact Us", style: TextStyles.font16Regular),
                  leading: SvgPicture.asset(AppImages.contactUs),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Settings", style: TextStyles.font16Regular),
                  leading: SvgPicture.asset(AppImages.settings),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Help", style: TextStyles.font16Regular),
                  leading: SvgPicture.asset(AppImages.help),
                ),
                GestureDetector(
                  onTap: () {
                    AppHiveLocalStorage.clear(Hive.box(AppSavedKey.globalBox));
                    AppNavigator.go(context, AppRoutes.loginScreen);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("SiginOut", style: TextStyles.font16Regular),
                    leading: SvgPicture.asset(AppImages.signOut),
                  ),
                ),
                Spacer(),
                Container(
                  width: AppWidth.fullWidth(context) * .4,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppWidth.w20,
                    vertical: AppHight.h14,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsManager.lightPink,
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: AppWidth.w6,
                    children: [
                      SvgPicture.asset(AppImages.upgrade),
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            "Upgrade Pro",
                            maxLines: 1,
                            softWrap: true,
                            style: TextStyles.font14Regular.copyWith(
                              color: ColorsManager.mainColor,
                            ),
                          ),
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
