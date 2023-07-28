import 'package:dhairya/utils/app_color.dart';
import 'package:dhairya/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/action_sheet.dart';
import '../../../common/loading.dart';

class RealStories extends StatelessWidget {
  const RealStories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textColor1),
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.snowWhite,
        title: const Text(
          'Real Stories',
          style: TextStyle(
            color: AppColors.textColor1,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: storyData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showContentDialog(context, storyData[index]);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 0.1.sh,
                decoration: BoxDecoration(
                  // color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(15),
                  // gradient: const LinearGradient(colors: [
                  //   Color(0xff98DE5B),
                  //   Color(0xff08E1AE),
                  // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image.network(
                        storyData[index].image,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Loading();
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(
                          width: 125,
                          child: Icon(
                            Icons.error,
                            color: AppColors.lightRed,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            storyData[index].title,
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.textColor1,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            storyData[index].subTitle,
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
