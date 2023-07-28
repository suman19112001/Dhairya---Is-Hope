import 'package:dhairya/utils/app_color.dart';
import 'package:flutter/material.dart';

class CarousalSlider extends StatelessWidget {
  const CarousalSlider({
    super.key,
    required this.pageController,
    required this.image,
    required this.itemCount,
    required this.onPageChanged,
  });
  final PageController pageController;

  final List<String> image;
  final int itemCount;
  final void Function(int) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: PageView.builder(
        itemCount: itemCount,
        pageSnapping: true,
        controller: pageController,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            curve: Curves.easeInOutCubic,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.5),
                  offset: const Offset(1, 1),
                  blurRadius: 3,
                )
              ],
              image: DecorationImage(
                image: NetworkImage(image[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        onPageChanged: onPageChanged,
      ),
    );
  }
}
