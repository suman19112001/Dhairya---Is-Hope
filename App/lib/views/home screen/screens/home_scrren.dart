import 'package:animate_do/animate_do.dart';
import 'package:dhairya/common/custom_text.dart';
import 'package:dhairya/common/heading_row.dart';

import 'package:dhairya/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/tow_boxes_data.dart';
import '../widgets/carousal_images.dart';
import '../widgets/top_articles_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.snowWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: customText(
          "Dhairya - Is Hope",
          color: AppColors.textColor1,
          isBold: true,
          size: 20,
          letterSpacing: 1.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: customText("Progress",
                  size: 18, isBold: true, color: AppColors.textColor1),
            ),
            TwoBoxesData(height: 0.2.sh),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: customText("Next Goal",
                  size: 18, isBold: true, color: AppColors.textColor1),
            ),
            FadeInRight(
              child: Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 0.15.sh,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.yellow.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "Consumne not more than 20mg nicotine (1 cigaratte pack).",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.textColor1,
                                  letterSpacing: 1),
                            ),
                            Text(
                              "2 days left",
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textColor1,
                                letterSpacing: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 70.h,
                        width: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.teal.withOpacity(0.5),
                        ),
                        child: Image.asset(
                          "assets/images/presents.png",
                          scale: 1.5,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            HeadingRow(
                heading: "Top Articles", prefixText: "All", prefixTap: () {}),
            //SizedBox(height: 10.h),
            FadeInRight(child: const TopArticles()),
            const SizedBox(height: 15),
            const QuitTobacooBanner(),

            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
