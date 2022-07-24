import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_app/models/product.dart';
import 'package:practice_app/providers/products_provider.dart';
import '../models/http_exception.dart';

// class CheckingApi with ChangeNotifier {
//   Future<void> checking(String val1, String val2) async {
//     const url =
//         "https://localhost:44359/api/values?key=FfgfS-ZInPupSAFZbvDhnFZlQSFeLCEAchz2KFKj1eoN1GsJaQzyModFD58DqaI4Jj1jC7QFyMAyA5-xO1PREN4pdIoqzZAs6N3q0Kd1Fi5E8AzBRAuQRJE4lAb841HOg2eJqOBZuAeynjVaLlDnjO8vAnBjK_SATqfUpcDysIq9cXkB03GF42SbFUoXza-KHqMjCa3isXBxUiMIKy71tfBWYZuhjbJgYxJixffiGzsD92R5g6a4Omz4GFsED7JkM43JywSm3mTv2R2E4vUe-kMcZnn5TM7uulXztnzHFr3QJOePiWhokw86hBc8wpLppXv4cfUHbNxKOw6jvk3ln4Hjm9sRqTUD9mVuE9oKIjoTx2URIcfE2j6lnSo6EQ7Cdsz1G5N0yPWUKCuCjXJAmQg-erwQKPpPh32UmHyEUn9UVI6aJuDAS_-bb9Ddv1bU48DSutSX9-OqWTpUjn8-BDbv5djf48f_9P3sSLICFM5RuehDyRjBtgBXeuJtrzTx";
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         body: json.encode(
//           {
//             'value1': val1,
//             'value2': val2,
//           },
//         ),
//       );
//       final responseData = json.decode(response.body);
//       if (responseData['error'] != null) {
//         throw HttpException(responseData['error']['message']);
//       }
//       if (kDebugMode) {
//         print('done');
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }
// }
Future<List<ProductList>> getData() async {
  late List<ProductList> productList = [];
  final data;
  try {
    final response = await http.post(
        //Uri.parse("http://192.168.50.107:45455/V1/json/data/products"),
        Uri.parse("http://192.168.50.106:5000/products"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode({
          "param": {"LanguageID": 2, "CategoryID": 3}
        }));
    print('API Response:');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body)['Data'] as List;
      print(jsonResponse);
      data = jsonResponse.map((e) => ProductList.fromJson(e)).toList();
      print(data[0]);
      productList = (jsonResponse.map((e) => ProductList.fromJson(e)).toList());
      //productList = ProductList.fromJson(jsonResponse);
      // jsonResponse.forEach(item){
      //   productList.add(ProductList.fromJson(item));
      // }
    } else {
      print("something went wrong!");
    }
  } catch (e) {
    print(e.toString());
  }
  print("Product List:");
  print(productList);
  return productList;
}
