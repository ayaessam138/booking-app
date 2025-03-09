import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/core/widgets/app_button.dart';
import 'package:bookingapp/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginTextFields extends StatefulWidget {
  const LoginTextFields({super.key});

  @override
  _LoginTextFieldsState createState() => _LoginTextFieldsState();
}

class _LoginTextFieldsState extends State<LoginTextFields> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isSwitched = true;
  bool _isObscure = true; 


  final String staticEmail = "test@gmail.com";
  final String staticPassword = "123456";

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (emailController.text == staticEmail &&
          passwordController.text == staticPassword) {
        AppNavigator.go(context, AppRoutes.bottomNavBarScreen);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid email or password!"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: AppHight.h15,
        children: [
          AppTextField(
            controller: emailController,
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
                child: SvgPicture.asset(AppImages.envleop, fit: BoxFit.fill),
              ),
            ),
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return "Email cannot be empty";
              }
              return null;
            },
          ),

          AppTextField(
            controller: passwordController,
            obscureText: _isObscure, 
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure; 
                });
              },
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                size: 16.sp,
              ),
            ),
            suffixIconColor: ColorsManager.greyDarkColor,
            hintText: "Your Password",
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
              if (val == null || val.isEmpty) {
                return "Password cannot be empty";
              }
              return null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeColor: ColorsManager.white,
                    activeTrackColor: ColorsManager.mainColor,
                    inactiveTrackColor: ColorsManager.greyColor,
                  ),
                  Text("Remember Me", style: TextStyles.font14Regular),
                ],
              ),
              Text("Forgot Password?", style: TextStyles.font14Regular),
            ],
          ),
          Center(child: AppButton(label: 'Sign In', onTap: _login)),
        ],
      ),
    );
  }
}
