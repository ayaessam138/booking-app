import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/feature/onboading/persentations/widgets/on_boarding_indicator.dart';
import 'package:flutter/material.dart';

class OnBordingContanier extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final String thirdLabel;
  final String fourthLabel;
  final int index;
  final void Function() onPressedSkip;
  final void Function() onPressedNext;

  const OnBordingContanier({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.thirdLabel,
    required this.fourthLabel,
    required this.index,
    required this.onPressedSkip,
    required this.onPressedNext,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppWidth.w40,
        vertical: AppHight.h25,
      ),
      height: AppHight.fullHight(context) * .45,
      width: AppWidth.fullWidth(context),
      decoration: BoxDecoration(
        color: ColorsManager.mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppRadius.r48),
          topRight: Radius.circular(AppRadius.r48),
        ),
      ),
      child: Column(
        spacing: AppHight.h10,
        children: [
          FittedBox(
            child: Text(
              firstLabel,
              style: TextStyles.font22Medium.copyWith(color: ColorsManager.white),
            ),
          ),
          FittedBox(
            child: Text(
              secondLabel,
              style: TextStyles.font22Medium.copyWith(color: ColorsManager.white),
            ),
          ),
          FittedBox(
            child: Text(
              maxLines: 1,
              softWrap: true,
              thirdLabel,
              style: TextStyles.font16Regular.copyWith(
                color: ColorsManager.white,
              ),
            ),
          ),
          Text(
            fourthLabel,
            style: TextStyles.font16Regular.copyWith(
              color: ColorsManager.white,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: onPressedSkip,
                child: Text(
                  "Skip",
                  style: TextStyles.font18Medium.copyWith(
                    color: ColorsManager.white.withOpacity(0.5),
                  ),
                ),
              ),
              Row(
                spacing: AppWidth.w10,
                children: [
                  OnBoardingIndicator(isActive: index==0),
                  OnBoardingIndicator(isActive: index==1),
                  OnBoardingIndicator(isActive: index==2),
                ],
              ),
              TextButton(
                onPressed: onPressedNext,
                child: Text(
                  "Next",
                  style: TextStyles.font18Medium.copyWith(
                    color: ColorsManager.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
