import 'package:baby_eduction/const/app_fonts.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? blurRadius;
  final Widget? child;
  final String? text;
  final TextStyle? style;
  final void Function() onTap;

  const PrimaryButton({
    this.text,
    required this.onTap,
    this.borderColor,
    this.color,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.blurRadius,
    this.borderWidth,
    this.radius,
    this.borderRadius,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: borderRadius ?? BorderRadius.circular(radius?.r ?? 12.r),
        ),
        height: height?.h ?? 45.h,
        //
        width: width?.w,
        child: Center(
          child:
              child ??
              Text(
                text ?? '',
                textAlign: TextAlign.center,
                style:
                    style ??
                    kkBoldTextStyle().copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      letterSpacing: 0.3.sp,
                    ),
              ),
        ),
      ),
    );
  }
}
