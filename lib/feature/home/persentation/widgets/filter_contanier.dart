import 'package:bookingapp/core/helpers/app_values.dart';

import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FilterContanier extends StatelessWidget {
  const FilterContanier({
    super.key,
    required this.filterName,
    required this.filterIcon,
    required this.contanierColor,
  });
  final String filterName;
  final String filterIcon;
  final Color contanierColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: contanierColor,
      ),
      child: Row(
        spacing: AppWidth.w4,
        children: [
          SvgPicture.asset(filterIcon, height: AppHight.h20),
          Text(
            filterName,
            style: TextStyles.font12Regular.copyWith(
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
