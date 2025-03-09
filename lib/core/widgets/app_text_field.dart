import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';

class AppTextField extends StatelessWidget {
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isMultibleLines;
  final int maxLines;
  final String? hintText;
  final bool? isDense;
  final TextAlign? textAlign;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final bool? enabled;
  final TextEditingController? controller;
  final bool isAutofocus;
  final bool isNoBorder;
  final bool isNoErrorBorder;
  final BorderRadius? borderRadius;
  final Color? focusedBorderColor;
  final Color? unFocusedBorderColor;
  final Color? suffixIconColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final Color? fillColor;
  final String? labelText;
  const AppTextField({
    super.key,
    this.isAutofocus = false,
    this.isMultibleLines = false,
    this.obscureText = false,
    this.isNoErrorBorder = false,
    this.suffixIcon,
    this.suffixIconColor,
    this.hintText,
    this.isDense,
    this.textAlign,
    this.onTap,
    this.onEditingComplete,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.keyboardType,
    this.enabled,
    this.controller,
    required this.validator,
    this.isNoBorder = false,
    this.borderRadius,
    this.focusedBorderColor,
    this.maxLines = 1,
    this.unFocusedBorderColor,
    this.hintStyle,
    this.textStyle,
    this.contentPadding,
    this.prefixIcon,
    this.fillColor,
    this.autovalidateMode,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      style: textStyle ?? TextStyle(fontSize: 14.sp),
      maxLines: isMultibleLines ? null : maxLines,
      textAlign: textAlign ?? TextAlign.start,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: onTapOutside,
      enabled: enabled,
      controller: controller,
      validator: ((value) => validator(value)),
      autofocus: isAutofocus,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: ColorsManager.black,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: fillColor ??
            Colors.transparent, 
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIconColor:suffixIconColor?? ColorsManager.mainColor,

        hintStyle: hintStyle ?? TextStyle(fontSize: 12.sp),
        isDense: isDense,
        focusedErrorBorder: isNoErrorBorder ? InputBorder.none : null,
        errorBorder: isNoErrorBorder ? InputBorder.none : null,
        contentPadding: contentPadding ?? EdgeInsets.all(14.w),
        border: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppRadius.rDefault),
          borderSide: BorderSide(
            color: isNoBorder
                ? Colors.transparent
                : unFocusedBorderColor ?? Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppRadius.rDefault),
          borderSide: BorderSide(
            color: isNoBorder
                ? Colors.transparent
                : unFocusedBorderColor ?? Theme.of(context).hintColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppRadius.rDefault),
          borderSide: BorderSide(
            color: isNoBorder
                ? Colors.transparent
                : focusedBorderColor ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
