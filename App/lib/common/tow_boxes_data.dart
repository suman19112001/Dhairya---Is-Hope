import 'package:dhairya/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/app_color.dart';

class TwoBoxesData extends StatelessWidget {
  const TwoBoxesData({
    super.key,
    required this.height,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CircularPercentIndicator(
                radius: 50.r,
                lineWidth: 10.0,
                percent: 0.76,
                animation: true,
                animateFromLastPercent: true,
                circularStrokeCap: CircularStrokeCap.round,
                center: const Text(
                  "76%",
                  style: TextStyle(
                    color: AppColors.snowWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
                progressColor: AppColors.teal,
                backgroundColor: AppColors.lightGreen.withOpacity(0.5),
                // arcBackgroundColor: AppColors.lightGreen,
                // arcType: ArcType.FULL_REVERSED,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: height,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Non-smoker since',
                    style: TextStyle(
                      color: AppColors.snowWhite,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  customText(
                    '7 Days',
                    size: 22,
                    isBold: true,
                    letterSpacing: 1.0,
                    color: AppColors.snowWhite,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: '₹ 240',
                          style: TextStyle(
                            color: AppColors.darkGreen,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: ' saved 😊',
                          style: TextStyle(
                            color: AppColors.darkGreen.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
