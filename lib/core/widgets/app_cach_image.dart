
import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/theming/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCacheImage extends StatelessWidget {
  final String image;
  final String? defaultImage;
  final double? width;
  final double? height;
  final bool isNotCircle;
  final BoxFit? boxFit;
  final BoxFit? placeholderFit;

  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  const AppCacheImage({
    super.key,
    required this.image,
    this.defaultImage,
    this.width,
    this.height,
    this.isNotCircle = false,
    this.boxFit,
    this.placeholderFit,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, url, error) => Container(
        width: width ?? 70.sp,
        height: height ?? 70.sp,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          borderRadius: isNotCircle
              ? borderRadius ?? BorderRadius.circular(AppRadius.rDefault)
              : null,
          shape: isNotCircle ? BoxShape.rectangle : BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              defaultImage ?? AppImages.placholder,
            ),
            fit: placeholderFit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: ((context, url) => Container(
            width: width ?? 70.sp,
            height: height ?? 70.sp,
            decoration: BoxDecoration(
              color:
                  backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
              borderRadius: isNotCircle
                  ? borderRadius ?? BorderRadius.circular(AppRadius.rDefault)
                  : null,
              shape: isNotCircle ? BoxShape.rectangle : BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  defaultImage ?? AppImages.placholder,
                ),
                fit: placeholderFit ?? BoxFit.cover,
              ),
            ),
          )),
      imageUrl:  image ,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width ?? 70.sp,
          height: height ?? 70.sp,
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            borderRadius: isNotCircle
                ? borderRadius ?? BorderRadius.circular(AppRadius.rDefault)
                : null,
            shape: isNotCircle ? BoxShape.rectangle : BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit ?? BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
