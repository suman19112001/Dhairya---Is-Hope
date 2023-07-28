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

import 'package:http/http.dart' as http;
import 'dart:convert';

String _url = 'http://localhost:5000/articles/article';
Future<void> fetchData() async {
  var url = Uri.parse(_url); // Replace with your server's URL

  // Send a GET request to the server
  var response =
      await http.get(Uri.parse('http://192.168.219.165:5000/articles/article'));

  if (response.statusCode == 200) {
    // Data fetched successfully
    var responseData = json.decode(response.body);
    // Process the fetched data
    print('Fetched data: $responseData');
  } else {
    // Data fetch failed
    print('Data fetch failed. Error code: ${response.statusCode}');
  }
}

// Future<http.Response> fetchData() {
//   return http.get(Uri.parse('http://10.0.2.2:5000/articles/article'));
// }
