import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/loading.dart';
import '../../../utils/app_color.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List _youtube = [];

  Future<void> readYoutubeJson() async {
    final String response =
        await rootBundle.loadString('assets/json_data/youtubeVideos.JSON');
    final data = await json.decode(response);
    setState(() {
      _youtube = data["youtube"];
      print(_youtube.length);
    });
  }

  @override
  void initState() {
    super.initState();
    readYoutubeJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textColor1),
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.snowWhite,
        title: const Text(
          'Videos',
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
        itemCount: _youtube.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _launchUrl(_youtube[index]['article']);
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
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image.network(
                        _youtube[index]['coverImage'],
                        width: 100,
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _youtube[index]['title'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.textColor1,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              _youtube[index]['subtitle'],
                              maxLines: 1,
                              style: const TextStyle(
                                color: AppColors.textColor,
                                fontSize: 16,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
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

Future<void> _launchUrl(String _url) async {
  if (!await launchUrl(Uri.parse(_url))) {
    throw Exception('Could not launch $_url');
  }
}
