import 'package:dhairya/common/custom_text.dart';
import 'package:dhairya/utils/app_color.dart';
import 'package:flutter/material.dart';

class HeadingRow extends StatelessWidget {
  const HeadingRow({
    super.key,
    required this.heading,
    required this.prefixText,
    required this.prefixTap,
    this.headingColor = AppColors.textColor1,
  });
  final String heading;
  final String prefixText;
  final VoidCallback prefixTap;
  final Color headingColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customText(heading, size: 18, color: headingColor, isBold: true),
          InkWell(
            onTap: prefixTap,
            child: customText(prefixText,
                size: 18, color: AppColors.textColor, isBold: true),
          ),
        ],
      ),
    );
  }
}
