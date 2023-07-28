import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:dhairya/common/custom_text.dart';
import 'package:dhairya/utils/app_color.dart';
import 'package:dhairya/views/health/widgets/two_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../detail screen/screen/detail_screen.dart';

class HealthScrenn extends StatefulWidget {
  const HealthScrenn({super.key});

  @override
  State<HealthScrenn> createState() => _HealthScrennState();
}

DateTime now = DateTime.now();
String currentDateYear = DateFormat('MMM d, yyyy').format(now);

var formatterTime = DateFormat('kk');
String currentTime = formatterTime.format(now);

class _HealthScrennState extends State<HealthScrenn> {
  String greetText = '';

  void setGreetText() {
    if (int.parse(currentTime) <= 12) {
      greetText = 'GOOD  MORNING';
    } else if (int.parse(currentTime) <= 17) {
      greetText = 'GOOD AFTERNOON';
    } else {
      greetText = 'GOOD EVENING';
    }
  }

  List _blogs = [];

  Future<void> readBlogsJson() async {
    final String response =
        await rootBundle.loadString('assets/json_data/BlogsofExSmokers.JSON');
    final data = await json.decode(response);
    setState(() {
      _blogs = data["blogs"];
      print(_blogs.length);
    });
  }

  List _remedies = [];

  Future<void> readRemediesJson() async {
    final String response =
        await rootBundle.loadString('assets/json_data/DomesticRemedies.JSON');
    final data = await json.decode(response);
    setState(() {
      _remedies = data["remedies"];
      print(_remedies.length);
    });
  }

  List _problems = [];

  Future<void> readProblemsJson() async {
    final String response =
        await rootBundle.loadString('assets/json_data/ProblemsofSmoking.JSON');
    final data = await json.decode(response);
    setState(() {
      _problems = data["problems"];
      print(_problems.length);
    });
  }

  List _stories = [];

  Future<void> readStoriesJson() async {
    final String response =
        await rootBundle.loadString('assets/json_data/storiesOfExSmokres.JSON');
    final data = await json.decode(response);
    setState(() {
      _stories = data["stories"];
      print(_stories.length);
    });
  }

  @override
  void initState() {
    super.initState();
    setGreetText();
    readBlogsJson();
    readRemediesJson();
    readStoriesJson();
    readProblemsJson();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkGreen,
      body: SingleChildScrollView(
        child: Stack(
          //alignment: Alignment.topCenter,
          children: [
            Container(
              height: size.height * 0.7,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/background/5.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  FadeInUp(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(greetText, isBold: true),
                          customText(
                            "Vishwas",
                            isBold: true,
                            font: "Roboto Slab",
                            size: 24,
                            color: AppColors.textColor1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child:
                        customText(currentDateYear, color: AppColors.snowWhite),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: customText(
                      "Today's Activities",
                      isBold: true,
                      font: "Roboto Slab",
                      size: 24,
                      color: AppColors.snowWhite,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _blogs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            data: _blogs[index],
                                          )));
                            },
                            child: Container(
                              height: 120,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(left: 16),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: AppColors.snowWhite,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text("❤"),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: customText(
                                                _blogs[index]['title'],
                                                maxLine: 1,
                                                isBold: true,
                                                font: "Roboto Slab",
                                                size: 18,
                                                color: AppColors.textColor1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        customText(
                                          _blogs[index]['summary'],
                                          maxLine: 2,
                                          color: AppColors.textColor,
                                        ),
                                        const Text(
                                          "Read more",
                                          style: TextStyle(
                                            color: AppColors.teal,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/health/blog.png",
                                    //width: 50,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  const TwoSections(),
                  // Container(
                  //   height: 600,
                  //   decoration: const BoxDecoration(
                  //     color: AppColors.snowWhite,
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(15),
                  //       topRight: Radius.circular(15),
                  //     ),
                  //   ),
                  // )
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: customText(
                      "Domestic Remedies",
                      isBold: true,
                      size: 18,
                      color: AppColors.snowWhite,
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: _remedies.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          data: _remedies[index],
                                        )));
                          },
                          child: Container(
                            //height: 0.45.sh,
                            width: double.maxFinite,
                            margin: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.snowWhite,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 0.2.sh,
                                  width: size.width,

                                  decoration: BoxDecoration(
                                    color: AppColors.snowWhite,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.textColor1
                                            .withOpacity(0.2),
                                        offset: const Offset(0, 6),
                                        blurRadius: 8,
                                      )
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          // "https://images.unsplash.com/photo-1607914660217-754fdd90041d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzh8fHlvZ2F8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                                          _remedies[index]['coverImage']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // child: Image.network(
                                  //   "https://images.unsplash.com/photo-1607914660217-754fdd90041d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzh8fHlvZ2F8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                const SizedBox(height: 15),
                                customText(
                                  _remedies[index]['title'],
                                  size: 16,
                                  color: AppColors.lightGreen,
                                  isBold: true,
                                ),
                                const SizedBox(height: 10),
                                customText(
                                  _remedies[index]['subtitle'],
                                  isBold: true,
                                  font: "Roboto Slab",
                                  size: 16,
                                  color: Colors.grey.shade800,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _remedies[index]['summary'],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColors.textColor,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  "Read more",
                                  style: TextStyle(
                                    color: AppColors.teal,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: customText(
                      "Problems of Smoking",
                      isBold: true,
                      size: 18,
                      color: AppColors.snowWhite,
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _problems.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            data: _problems[index],
                                          )));
                            },
                            child: Container(
                              height: 120,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(left: 16),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: AppColors.snowWhite,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text("❤"),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: customText(
                                                _problems[index]['title'],
                                                maxLine: 1,
                                                isBold: true,
                                                font: "Roboto Slab",
                                                size: 18,
                                                color: AppColors.textColor1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        customText(
                                          _problems[index]['summary'],
                                          maxLine: 2,
                                          color: AppColors.textColor,
                                        ),
                                        const Text(
                                          "Read more",
                                          style: TextStyle(
                                            color: AppColors.teal,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/health/problems.png",
                                    //width: 50,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: customText(
                      "Stories of Ex-Smokers",
                      isBold: true,
                      size: 18,
                      color: AppColors.snowWhite,
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _stories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            data: _stories[index],
                                          )));
                            },
                            child: Container(
                              height: 120,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(left: 16),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: AppColors.snowWhite,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text("❤"),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: customText(
                                                _stories[index]['title'],
                                                maxLine: 1,
                                                isBold: true,
                                                font: "Roboto Slab",
                                                size: 18,
                                                color: AppColors.textColor1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        customText(
                                          _stories[index]['summary'],
                                          maxLine: 2,
                                          color: AppColors.textColor,
                                        ),
                                        const Text(
                                          "Read more",
                                          style: TextStyle(
                                            color: AppColors.teal,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/health/read.png",
                                    //width: 50,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
