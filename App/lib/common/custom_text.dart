import 'package:dhairya/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String primaryFontName = 'Urbanist';
// const Color txtColor = Colors.grey.shade100;
Text customText(text,
    {isBold = false,
    double size = 14,
    font = 'Urbanist',
    TextDecoration decoration = TextDecoration.none,
    Color color = AppColors.textColor,
    weight = FontWeight.normal,
    int maxLine = 4,
    int minLine = 1,
    TextAlign textAlign = TextAlign.left,
    TextOverflow overflow = TextOverflow.ellipsis,
    letterSpacing = 0.5}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLine,
    style: GoogleFonts.getFont(
      font,
      color: color,
      fontWeight: isBold ? FontWeight.bold : weight,
      fontSize: size,
      decoration: decoration,
      letterSpacing: letterSpacing,
    ),
  );
}
