import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpTextfield extends StatefulWidget {
  const OtpTextfield({super.key});

  @override
  _OtpTextfieldState createState() => _OtpTextfieldState();
}

class _OtpTextfieldState extends State<OtpTextfield> {
  String enteredOtp = ""; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtpTextField(
          borderRadius: BorderRadius.circular(AppRadius.r12),
          fieldWidth: AppWidth.w55,
          fieldHeight: AppHight.h130,
          numberOfFields: 4,
          focusedBorderColor: ColorsManager.mainColor,
          borderColor: ColorsManager.greyColor,
          keyboardType: TextInputType.number,
          showFieldAsBox: true,
          onCodeChanged: (String code) {
        
            setState(() {
              enteredOtp = code;
            });
          },
          onSubmit: (String verificationCode) {
            setState(() {
              enteredOtp = verificationCode;
            });
          },
        ),
        Center(
          child: AppButton(
            label: 'Continue',
            onTap: () {
              if (enteredOtp == "0000") {
          
                AppNavigator.go(context, AppRoutes.bottomNavBarScreen);
              } else {
              
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Invalid OTP! Please try again."),
                    backgroundColor: ColorsManager.darkRed,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
