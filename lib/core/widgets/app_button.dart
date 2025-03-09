import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
   AppButton({super.key, required this.label, this.onTap, this.width});
  final String label;
  double? width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? AppWidth.fullWidth(context) * .75,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorsManager.greyButtonColor,
              spreadRadius: 5,
              blurRadius: 35,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(AppRadius.r15),
          color: ColorsManager.mainColor,
        ),
        padding: EdgeInsets.symmetric(
          vertical: AppHight.h15,
          horizontal: AppWidth.w12,
        ),
        child: Row(
          children: [
            Spacer(),
            Text(
              label,
              style: TextStyles.font16Regular.copyWith(
                color: ColorsManager.white,
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(AppPadding.p6),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward_rounded,
                color: ColorsManager.mainColor,
                size: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
