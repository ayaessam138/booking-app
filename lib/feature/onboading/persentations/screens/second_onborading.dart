import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:flutter/material.dart';

class SecondOnborading extends StatelessWidget {
  const SecondOnborading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.secondOnboarding,
          width: AppWidth.fullWidth(context) * .7,
          height: AppHight.fullHight(context) * .45,
        ),
      ],
    );
  }
}
