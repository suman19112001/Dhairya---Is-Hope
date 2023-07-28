import 'package:dhairya/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/custom_text.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.assetIcon, required this.title});
  final String assetIcon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      minLeadingWidth: 25,
      leading: Image.asset(
        assetIcon,
        height: 24,
        fit: BoxFit.contain,
      ),
      title: customText(
        title,
        isBold: true,
        size: 14.sp,
        color: AppColors.textColor1,
        letterSpacing: 1.0,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
      ),
    );
  }
}
