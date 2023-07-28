import 'package:carousel_slider/carousel_slider.dart';
import 'package:dhairya/utils/assets_data.dart';
import 'package:flutter/material.dart';

import '../../../common/loading.dart';
import '../../../utils/app_color.dart';

class QuitTobacooBanner extends StatelessWidget {
  const QuitTobacooBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: TobaccoImages.tobacoo
          .map(
            (e) => Builder(
              builder: ((context) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        e,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.maxFinite,
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
                  )),
            ),
          )
          .toList(),
      options:
          CarouselOptions(viewportFraction: 1, height: 200, autoPlay: true),
    );
  }
}
