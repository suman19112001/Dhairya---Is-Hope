import 'dart:convert';

import 'package:dhairya/common/custom_text.dart';
import 'package:dhairya/common/loading.dart';
import 'package:dhairya/utils/app_color.dart';
import 'package:dhairya/views/detail%20screen/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopArticles extends StatefulWidget {
  const TopArticles({super.key});

  @override
  State<TopArticles> createState() => _TopArticlesState();
}

class _TopArticlesState extends State<TopArticles> {
  List _articles = [];

  Future<void> readArticleJson() async {
    final String response =
        await rootBundle.loadString('assets/json_data/Articles.JSON');
    final data = await json.decode(response);
    setState(() {
      _articles = data["articles"];
    });
  }

  @override
  void initState() {
    super.initState();
    readArticleJson();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.27.sh,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _articles.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            data: _articles[index],
                          )));
            },
            child: Card(
              elevation: 2,
              margin: const EdgeInsets.only(left: 16, bottom: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: 0.5.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.network(
                        // "https://img.freepik.com/free-photo/flat-lay-no-tobacco-day-elements-assortment_23-2148874832.jpg?size=626&ext=jpg&uid=R48191266&ga=GA1.1.1399549575.1672332440&semt=ais",
                        _articles[index]['coverImage'],
                        cacheWidth: 540,
                        cacheHeight: 240,
                        height: 0.1.sh,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
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
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: AppColors.snowWhite,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(_articles[index]['subtitle'],
                                size: 15.sp,
                                color: AppColors.green,
                                isBold: true),
                            customText(
                              _articles[index]['title'],
                              letterSpacing: 0.0,
                              maxLine: 1,
                              color: AppColors.textColor1,
                              isBold: true,
                              size: 14.sp,
                            ),
                            customText(_articles[index]['summary'],
                                maxLine: 3, size: 12.sp),
                            customText(
                              "10.5K",
                              color: AppColors.textColor1,
                              size: 16.sp,
                            )
                          ],
                        ),
                      ),
                    )
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

// Widget topArticleCards() {
//   return SizedBox(
//     height: 0.27.sh,
//     child: ListView.builder(
//       shrinkWrap: true,
//       itemCount: 5,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const DetailScreen()));
//           },
//           child: Card(
//             elevation: 2,
//             margin: const EdgeInsets.only(left: 16, bottom: 5),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             child: Container(
//               width: 0.5.sw,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 // boxShadow: const [
//                 //   BoxShadow(
//                 //     offset: Offset(2, 2),
//                 //     blurRadius: 5,
//                 //     color: Color.fromRGBO(0, 0, 0, 0.16),
//                 //   )
//                 // ]
//                 //color: AppColors.lightGreen.withOpacity(0.2),
//               ),
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(10)),
//                     child: Image.network(
//                       "https://img.freepik.com/free-photo/flat-lay-no-tobacco-day-elements-assortment_23-2148874832.jpg?size=626&ext=jpg&uid=R48191266&ga=GA1.1.1399549575.1672332440&semt=ais",
//                       cacheWidth: 540,
//                       cacheHeight: 240,
//                       height: 0.1.sh,
//                       width: double.maxFinite,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) return child;
//                         return const Loading();
//                       },
//                       errorBuilder: (context, error, stackTrace) =>
//                           const SizedBox(
//                         width: 125,
//                         child: Icon(
//                           Icons.error,
//                           color: AppColors.lightRed,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: const BoxDecoration(
//                         color: AppColors.snowWhite,
//                         borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(10),
//                           bottomLeft: Radius.circular(10),
//                         ),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           customText("Thomas Oppong",
//                               size: 15.sp,
//                               color: AppColors.green,
//                               isBold: true),
//                           customText(
//                             "8 Habbits to control smoking",
//                             letterSpacing: 0.0,
//                             maxLine: 1,
//                             color: AppColors.textColor1,
//                             isBold: true,
//                             size: 14.sp,
//                           ),
//                           customText(
//                               "Key lifestyle habbits that can keep your brain healthy.",
//                               size: 12.sp),
//                           customText(
//                             "10.5K",
//                             color: AppColors.textColor1,
//                             size: 16.sp,
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
