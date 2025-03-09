import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 255),
      width: AppWidth.w10,
      height: AppHight.h10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            isActive
                ? ColorsManager.white.withOpacity(0.5)
                : ColorsManager.white,
      ),
    );
  }
}
