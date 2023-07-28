import 'package:dhairya/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_color.dart';

class BuildCustomForm extends StatelessWidget {
  const BuildCustomForm({
    super.key,
    required this.text1,
    required this.text2,
    required this.controller,
    required this.hintText,
    required this.image,
    this.imageAligment = Alignment.bottomCenter,
  });

  final String text1;
  final String text2;
  final TextEditingController controller;
  final String hintText;
  final String image;
  final AlignmentGeometry imageAligment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text1,
            size: 24,
            color: AppColors.textColor1,
            letterSpacing: 1.0,
            font: "Roboto Slab",
          ),
          const SizedBox(height: 10),
          customText(text2,
              size: 24,
              color: AppColors.textColor1,
              letterSpacing: 1.0,
              font: "Roboto Slab"),
          const SizedBox(height: 15),
          TextFormField(
            autofocus: false,
            controller: controller,
            cursorColor: AppColors.grey,
            style: const TextStyle(
              letterSpacing: 1,
            ),
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: AppColors.lightGrey,
                  // width: 2,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: AppColors.lightGrey,
                  // width: 2,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: AppColors.textColor,
                  // width: 2,
                ),
              ),
              hintText: hintText,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: imageAligment,
            child: Image.asset(
              image,
              height: 0.4.sh,
            ),
          )
        ],
      ),
    );
  }
}
