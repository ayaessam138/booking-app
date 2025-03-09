import 'package:bookingapp/core/helpers/app_spacing.dart';
import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w25),
      height: AppHight.fullHight(context) * .3,
      width: AppWidth.fullWidth(context),
      decoration: BoxDecoration(
        color: ColorsManager.mainColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(AppRadius.r35),
          bottomLeft: Radius.circular(AppRadius.r35),
        ),
      ),
      child: Column(
        spacing: AppHight.h20,
        children: [
          AppSpace.vertical(AppHight.h10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                 onTap: onTap,
                child: Icon(Icons.menu_sharp, color: ColorsManager.white, size: 24.sp)),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Current Location",
                      style: TextStyles.font12Regular.copyWith(
                        color: ColorsManager.white.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                      "New Yourk, USA",
                      style: TextStyles.font14Medium.copyWith(
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.notifications,
                color: ColorsManager.white,
                size: 24.sp,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.search,
                color: ColorsManager.white,
                size: 24.sp,
              ),
              Expanded(
                child: AppTextField(
                  hintText: "Search...",
                  hintStyle: TextStyles.font20Medium.copyWith(
                    color: ColorsManager.white.withOpacity(0.3),
                  ),
                  isNoBorder: true,
                  validator: (val) {
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppPadding.p10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: ColorsManager.white,
                ),
                child: Row(
                  spacing: AppWidth.w4,
                  children: [
                    SvgPicture.asset(AppImages.filter, height: AppHight.h20),
                    Text(
                      "Filters",
                      style: TextStyles.font12Regular.copyWith(
                        color: ColorsManager.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
