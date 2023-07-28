import 'package:dhairya/models/story_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_color.dart';

showContentDialog(context, StoryModel story) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: ((context) => AlertDialog(
          title: Text(
            story.title,
            style: const TextStyle(
              fontSize: 22,
              color: AppColors.textColor1,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          content: SizedBox(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(story.image)),
              const SizedBox(height: 15),
              Text(
                story.desc,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          )),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: AppColors.lightRed,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Close",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: AppColors.green,
                ),
                onPressed: () {
                  _launchUrl(story.url);
                },
                child: const Text(
                  "Read More",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                )),
          ],
        )),
  );
}

Future<void> _launchUrl(String _url) async {
  if (!await launchUrl(Uri.parse(_url))) {
    throw Exception('Could not launch $_url');
  }
}
