import 'package:dhairya/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardBuilder extends StatelessWidget {
  const OnboardBuilder({
    super.key,
    required this.text,
    required this.body,
    required this.image,
  });
  final String text;
  final String body;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Spacer(flex: 4),
        Image.asset(
          image,
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.cover,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: AppColors.textColor1,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            body,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.sp, color: AppColors.textColor, height: 1.5),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
