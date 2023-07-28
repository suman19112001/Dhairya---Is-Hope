import 'package:dhairya/common/custom_text.dart';
import 'package:dhairya/utils/assets_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../utils/app_color.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.snowWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: customText(
          "Tracking",
          color: AppColors.textColor1,
          isBold: true,
          size: 20,
          letterSpacing: 1.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Non-smoker since',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.textColor,
                letterSpacing: 1,
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 150.r,
                      lineWidth: 10.0,
                      percent: 0.76,
                      animation: true,
                      animateFromLastPercent: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/cig.png',
                            height: 100,
                          ),
                          const SizedBox(height: 15),
                          customText(
                            '7',
                            isBold: true,
                            size: 30,
                            color: AppColors.green,
                          ),
                          const Text(
                            'Days',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.grey,
                              letterSpacing: 1,
                            ),
                          ),
                          const Row(
                            children: [],
                          )
                        ],
                      ),
                      progressColor: AppColors.teal,
                      backgroundColor: AppColors.lightGreen.withOpacity(0.5),
                      arcBackgroundColor: AppColors.lightGrey,
                      arcType: ArcType.HALF,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Daily Task's",
                  style: TextStyle(
                      color: AppColors.textColor1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
            ),
            ListView.builder(
                itemCount: task.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 0.15.sh,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: task[index].color),
                    child: Row(
                      children: [
                        Image.asset(task[index].image),
                        const SizedBox(width: 15),
                        customText(task[index].text,
                            letterSpacing: 1.0,
                            size: 18,
                            color: AppColors.snowWhite,
                            isBold: true),
                      ],
                    ),
                  );
                }),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
