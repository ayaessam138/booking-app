import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key, required this.image, required this.label});
  final String image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: AppHight.h15),
        width: AppWidth.fullWidth(context) * .8,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppWidth.w10,
          children: [
            SvgPicture.asset(image),
            Text(label, style: TextStyles.font16Regular.copyWith(
              color: ColorsManager.black
            )),
          ],
        ),
      ),
    );
  }
}
