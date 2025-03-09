import 'package:bookingapp/core/helpers/app_spacing.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/feature/login/persentation/widgets/login_options.dart';
import 'package:bookingapp/feature/login/persentation/widgets/login_textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(AppImages.background, fit: BoxFit.cover),
                  ),

                  Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppHight.h20,
                      children: [
                        AppSpace.vertical(AppHight.h20),
                        Center(child: Image.asset(AppImages.appLogo)),
                        AppSpace.vertical(AppHight.h10),
                        Text(
                          "Sign In",
                          style: TextStyles.font24Medium,
                          textAlign: TextAlign.start,
                        ),
                        LoginTextFields(),
                        LoginOptions(
                          image: AppImages.google,
                          label: "Login With Google",
                        ),
                        LoginOptions(
                          image: AppImages.facebook,
                          label: "Login With FaceBook",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: AppWidth.w2,
                          children: [
                            Text(
                              "Don’t have an account?",
                              style: TextStyles.font16Regular.copyWith(
                                color: ColorsManager.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AppNavigator.push(
                                  context,
                                  AppRoutes.registerScreen,
                                );
                              },
                              child: Text(
                                " Sign up",
                                style: TextStyles.font16Regular.copyWith(
                                  color: ColorsManager.mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
