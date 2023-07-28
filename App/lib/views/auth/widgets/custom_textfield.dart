import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

Widget customTextField({
  required TextEditingController controller,
  TextInputType keyBoardType = TextInputType.emailAddress,
  bool obscureText = false,
  required Icon prefixIcon,
  Widget? suffixIcon,
  required String hintText,
  required BuildContext context,
  dynamic validator,
}) {
  double height = MediaQuery.of(context).size.height;
  return TextFormField(
    autofocus: false,
    controller: controller,
    keyboardType: keyBoardType,
    obscureText: obscureText,
    //textInputAction: TextInputAction.next,
    validator: validator,
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
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding:
            height > 700 ? null : const EdgeInsets.symmetric(vertical: 10)
        //constraints: BoxConstraints(minHeight: 50, maxHeight: 50),
        ),
  );
}
