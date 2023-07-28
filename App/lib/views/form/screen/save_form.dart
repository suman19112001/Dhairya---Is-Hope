import 'package:dhairya/common/custom_text.dart';
import 'package:dhairya/utils/app_color.dart';
import 'package:flutter/material.dart';

class SaveForm extends StatelessWidget {
  const SaveForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: customText(
                  'Get Set Go !',
                  size: 24,
                  isBold: true,
                  color: AppColors.textColor1,
                  font: "Roboto Slab",
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'All set to live a smoke free life',
                  style: TextStyle(fontSize: 16, letterSpacing: 1.0),
                ),
              ),
              const SizedBox(height: 20),
              /////////<<<<<<<<<<<-------CLEANING------>>>>>>>>>/////////
              const Text(
                'Cleaning',
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '▶ Throw away all your cigarettes',
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: AppColors.textColor,
                ),
              ),
              const Text(
                '▶ Throw away your ashtray and other related items to smoking.',
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: AppColors.textColor,
                ),
              ),
              const Text(
                '▶ Hide your lighter and matchbox',
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 20),
              /////////<<<<<<<<<<<-------ANNOUNCEMENTS------>>>>>>>>>/////////

              const Text(
                'Announcements',
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '▶ Tell yur smoker friends about your pledge.',
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: AppColors.textColor,
                ),
              ),
              const Text(
                '▶ Also tell your non-smoker friends and ske them to help you.',
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: AppColors.textColor,
                ),
              ),
              const Text(
                '▶ Hide your lighter and matchbox',
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
