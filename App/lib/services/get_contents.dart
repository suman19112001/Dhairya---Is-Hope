// class GetAppContents {
//   Future<void> getArticles() async {
//     try {
//       final res =
//           await http.get(Uri.parse('http://localhost:5000/articles/article'));
//       var data = jsonDecode(res.body);
//       print(data);
//     } catch (e) {}
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String _url = 'http://localhost:5000/articles/article';
Future<void> fetchData() async {
  var url = Uri.parse(_url); // Replace with your server's URL

  // Send a GET request to the server
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Data fetched successfully
    var responseData = json.decode(response.body);
    // Process the fetched data
    if (kDebugMode) {
      print('Fetched data: $responseData');
    }
  } else {
    // Data fetch failed
    if (kDebugMode) {
      print('Data fetch failed. Error code: ${response.statusCode}');
    }
  }
}
