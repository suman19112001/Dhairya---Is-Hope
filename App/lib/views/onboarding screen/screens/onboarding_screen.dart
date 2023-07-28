import 'package:dhairya/common/round_buttons.dart';
import 'package:dhairya/views/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../widgets/custom_onboarding_builder.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
                children: const [
                  OnboardBuilder(
                    text: 'Give the gift of quitting!',
                    body:
                        "We all know someone who's been trying to quit only to keep falling back.",
                    image: 'assets/images/onboarding/sp1.png',
                  ),
                  OnboardBuilder(
                    text: 'Bet on yourself',
                    body:
                        "Put you hard-earned money on the line and set amount you wouldn't want to loose as your deterrant",
                    image: 'assets/images/onboarding/sp3.png',
                  ),
                  OnboardBuilder(
                    text:
                        'Track your progress, carvings and learn tips & tricks',
                    body:
                        'Get an overview of how you are performing and motivate yourself to achieve even more.',
                    image: 'assets/images/onboarding/sp4.png',
                  ),
                  OnboardBuilder(
                    text: 'A new healthier you',
                    body:
                        'Your body will begin healing itself and your mind will become more balanced.',
                    image: 'assets/images/onboarding/sp5.png',
                  ),
                  OnboardBuilder(
                    text: 'Hold yourself accountable',
                    body:
                        'There are no cutting corners. Beat your habbit for your loved ones.',
                    image: 'assets/images/onboarding/sp6.png',
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: currentIndex > 3
                  ? RoundButton(
                      text: 'Continue',
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LoginScreen()))),
                      color: AppColors.textColor1,
                    )
                  : RoundButton(
                      text: 'Next',
                      onPressed: () {
                        _pageController.jumpToPage(currentIndex + 1);
                      },
                      color: AppColors.textColor1,
                    ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: isActive ? AppColors.textColor1 : AppColors.textColor,
          borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 5; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
