import 'package:dhairya/utils/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../common/custom_text.dart';
import '../../../utils/app_color.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late PageController _pageController;
  int currentPage = 0;

  final List<String> tempImage = [
    "https://img.freepik.com/free-photo/arrangement-no-tobacco-day-elements_23-2148874870.jpg?size=626&ext=jpg&uid=R48191266&ga=GA1.2.1399549575.1672332440&semt=ais",
    "https://img.freepik.com/free-photo/flat-lay-no-tobacco-day-elements-arrangement_23-2148874839.jpg?size=626&ext=jpg&uid=R48191266&ga=GA1.2.1399549575.1672332440&semt=ais",
    "https://img.freepik.com/free-photo/lungs-formed-cigarettes_23-2148585869.jpg?size=626&ext=jpg&uid=R48191266&ga=GA1.1.1399549575.1672332440&semt=ais",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
    tempImage.shuffle();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.lightGreen,
              iconTheme: const IconThemeData(color: AppColors.textColor),
              elevation: 0,
              //floating: true,
              pinned: true,
              //snap: true,
              //stretch: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  // "https://img.freepik.com/free-photo/lungs-shape-with-cigarettes-concept_23-2148585867.jpg?size=626&ext=jpg&uid=R48191266&ga=GA1.1.1399549575.1672332440&semt=ais",
                  // "https://img.freepik.com/free-photo/flat-lay-no-tobacco-day-elements-assortment_23-2148874832.jpg?size=626&ext=jpg&uid=R48191266&ga=GA1.1.1399549575.1672332440&semt=ais",
                  widget.data['coverImage'],
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        customText(
                          widget.data['title'],
                          //letterSpacing: 1.0,
                          maxLine: 2,
                          color: AppColors.textColor1,
                          letterSpacing: 1.0,
                          isBold: true,
                          size: 18.sp,
                        ),
                        const SizedBox(height: 10),
                        customText(
                          widget.data['subtitle'],
                          size: 14.sp,
                          color: AppColors.green,
                          isBold: true,
                          letterSpacing: 1.0,
                        ),
                        const SizedBox(height: 15),
                        ReadMoreText(
                          widget.data['description'],
                          trimLines: 8,
                          trimMode: TrimMode.Line,
                          style: const TextStyle(
                              color: AppColors.textColor, letterSpacing: 1),
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.teal,
                          ),
                          lessStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CarousalSlider(
                    pageController: _pageController,
                    image: tempImage,
                    itemCount: tempImage.length,
                    onPageChanged: (page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicators(tempImage.length, currentPage),
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> indicators(imageLength, curIndex) {
    return List<Widget>.generate(
      imageLength,
      (index) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(3),
        width: curIndex != index ? 25 : 50,
        height: 5,
        decoration: BoxDecoration(
          color: curIndex != index ? AppColors.lightGrey : AppColors.lightGreen,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
