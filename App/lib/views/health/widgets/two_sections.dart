import 'package:dhairya/views/health/screen/real_stories.dart';
import 'package:dhairya/views/health/screen/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_color.dart';

class TwoSections extends StatelessWidget {
  const TwoSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const VideoScreen(),
                  ),
                );
              },
              child: Container(
                height: 0.3.sh,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/health/video.png',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Videos',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.snowWhite,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RealStories(),
                  ),
                );
              },
              child: Container(
                height: 0.3.sh,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icons/inspiration.png',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Real Stories',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.snowWhite,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
