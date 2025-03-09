import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/helpers/functions.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/widgets/app_button.dart';
import 'package:bookingapp/core/widgets/app_loading.dart';
import 'package:bookingapp/core/widgets/app_text_field.dart';
import 'package:bookingapp/feature/register/domain/entity/register_entity.dart';
import 'package:bookingapp/feature/register/persentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterTextfields extends StatelessWidget {
  RegisterTextfields({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            spacing: AppHight.h20,
            children: [
              AppTextField(
                controller: name,
                hintText: "Full Name",
                borderRadius: BorderRadius.circular(AppRadius.r10),
                unFocusedBorderColor: ColorsManager.greyColor,
                focusedBorderColor: ColorsManager.greyColor,
                contentPadding: EdgeInsets.all(AppPadding.p10),
                isDense: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: SvgPicture.asset(AppImages.email, fit: BoxFit.fill),
                  ),
                ),
                validator: (String? val) {
                  return AppHeleperFunctions.validateFullName(val);
                },
              ),
              AppTextField(
                controller: email,
                hintText: "abc@email.com",
                borderRadius: BorderRadius.circular(AppRadius.r10),
                unFocusedBorderColor: ColorsManager.greyColor,
                focusedBorderColor: ColorsManager.greyColor,
                contentPadding: EdgeInsets.all(AppPadding.p10),
                isDense: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: SvgPicture.asset(
                      AppImages.envleop,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                validator: (String? val) {
                  return AppHeleperFunctions.validateEmail(val);
                },
              ),
              AppTextField(
                controller: password,
                suffixIcon: Icon(Icons.remove_red_eye_outlined, size: 16.sp),
                suffixIconColor: ColorsManager.greyDarkColor,
                hintText: "Password",
                borderRadius: BorderRadius.circular(AppRadius.r10),
                unFocusedBorderColor: ColorsManager.greyColor,
                focusedBorderColor: ColorsManager.greyColor,
                contentPadding: EdgeInsets.all(AppPadding.p10),
                isDense: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(AppImages.lock, fit: BoxFit.fill),
                  ),
                ),
                validator: (String? val) {
                  return AppHeleperFunctions.validatePassword(val);
                },
              ),
              AppTextField(
                controller: confirmPassword,
                suffixIcon: Icon(Icons.remove_red_eye_outlined, size: 16.sp),
                suffixIconColor: ColorsManager.greyDarkColor,
                hintText: "Confirm Password",
                borderRadius: BorderRadius.circular(AppRadius.r10),
                unFocusedBorderColor: ColorsManager.greyColor,
                focusedBorderColor: ColorsManager.greyColor,
                contentPadding: EdgeInsets.all(AppPadding.p10),
                isDense: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(AppImages.lock, fit: BoxFit.fill),
                  ),
                ),
                validator: (String? val) {
                  return AppHeleperFunctions.validateConfirmPassword(
                    val,
                    confirmPassword.text,
                  );
                },
              ),
              Center(
                child: AppButton(
                  label: "SignUp",
                  onTap: () {
                    RegisterParamsEntity registerEntity = RegisterParamsEntity(
                      email: email.text,
                      name: name.text,
                      password: password.text,
                    );
                    if (_formKey.currentState!.validate()) {
                      RegisterCubit.of(
                        context,
                      ).getRegisterDeatils(registerEntity: registerEntity);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
      listenWhen:
          (previous, current) =>
              current is RegisterError ||
              current is RegisterLoading ||
              current is RegisterSuccess,
      listener: (context, state) {
        state.whenOrNull(
          RegisterLoading: () {
            FocusManager.instance.primaryFocus?.unfocus();
            AppLoading.loading(context);
          },
          RegisterSuccess: (data) {
            Navigator.pop(context);
            name.clear();
            email.clear();
            password.clear();
            confirmPassword.clear();
            AppNavigator.push(context, AppRoutes.otpScrren);
          },
          RegisterError: (data) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(data), backgroundColor: Colors.red),
            );
          },
        );
      },
    );
  }
}
