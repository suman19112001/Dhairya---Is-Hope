import 'package:dhairya/common/custom_text.dart';
import 'package:dhairya/common/round_buttons.dart';
import 'package:dhairya/utils/app_color.dart';
import 'package:dhairya/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.snowWhite,
        elevation: 0.0,
        title: customText(
          'Rewards',
          size: 22,
          color: AppColors.textColor1,
          letterSpacing: 1.0,
          isBold: true,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/rewards/r1.png",
                    height: 0.32.sh,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Challenge Board',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Collect badges and get rewarded',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 15),
                GridView.builder(
                  itemCount: Rewards().rewardIcons.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: FittedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                Rewards().rewardIcons[index],
                                height: 90,
                              ),
                              const SizedBox(height: 5),
                              customText(Rewards().rewardLabel[index],
                                  letterSpacing: 1.0, size: 18)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'Redeem',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.snowWhite,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/icons/discounts.png",
                              color: AppColors.textColor1,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    '30-50% discount',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textColor1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '1,000 Points',
                                    style:
                                        TextStyle(color: AppColors.textColor1),
                                  )
                                ],
                              ),
                            ),
                            RoundButton(
                                text: 'Reedem',
                                onPressed: () {},
                                color: AppColors.teal),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
