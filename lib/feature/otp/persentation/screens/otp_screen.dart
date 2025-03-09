import 'package:bookingapp/core/helpers/app_spacing.dart';
import 'package:bookingapp/core/helpers/app_values.dart';

import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';

import 'package:bookingapp/feature/otp/persentation/widgets/otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppHight.fullHight(context),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        AppImages.background,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppPadding.p16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_sharp, size: 24.sp),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            "Verification",
                            style: TextStyles.font24Medium.copyWith(
                              color: ColorsManager.black,
                            ),
                          ),
                          AppSpace.vertical(AppHight.h12),
                          Text(
                            "We’ve send you the verification code on +1 2620 0323 7631",
                            style: TextStyles.font16Regular.copyWith(
                              color: ColorsManager.black,
                            ),
                          ),
                          AppSpace.vertical(AppHight.h24),
                          OtpTextfield(),

            
                          AppSpace.vertical(AppHight.h24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: AppWidth.w2,
                            children: [
                              Text(
                                "Re-send code in ",
                                style: TextStyles.font16Regular.copyWith(
                                  color: ColorsManager.black,
                                ),
                              ),
                              Text(
                                "0:20",
                                style: TextStyles.font16Regular.copyWith(
                                  color: ColorsManager.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
