import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrganizerActionButton extends StatelessWidget {
  const OrganizerActionButton({
    super.key,
    required this.textColor,
    required this.buttonColor,
    required this.borderColor,
    required this.buttonLabel,
    required this.image,
  });
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final String buttonLabel;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:AppHight.h12,horizontal: AppWidth.w35),
      decoration: BoxDecoration(
        
        color: buttonColor,
        borderRadius: BorderRadius.circular(AppRadius.r12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        spacing: AppWidth.w14,
        children: [
          SvgPicture.asset(image),
          Text(
            buttonLabel,
            style: TextStyles.font16Regular.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
