import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_app/models/billingAddress.dart';
import 'package:practice_app/models/orderClass.dart';
import 'package:practice_app/models/product.dart';
import 'package:practice_app/models/shippingAdress.dart';
import 'package:practice_app/null-safe%20packages/date_time_picker/date_class.dart';
import 'package:practice_app/providers/orderProvider.dart';
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
        Uri.parse("http://192.168.50.107:45455/V1/json/data/products"),
        //Uri.parse("http://192.168.50.106:5000/products"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode({
          "param": {"LanguageID": 2, "CategoryID": 2}
        }));
    print('API Response:');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body)['Data'] as List;
      print(jsonResponse);
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

Future<List<BillingAddress>> getBillingAddress(int UserID) async {
  print("printing id: ");
  print(UserID);
  late List<BillingAddress> billingaddress = [];
  final data;
  try {
    final response = await http.post(
        Uri.parse("http://192.168.50.107:45455/V1/json/data/my-address"),
        //Uri.parse("http://192.168.50.106:5000/products"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode({
          "param": {"USerID": UserID}
        }));
    if (response.statusCode == 200) {
      final jsonResponse =
          json.decode(response.body)['Data']['BillingAddress'] as List;
      print(jsonResponse);
      data = jsonResponse.map((e) => BillingAddress.fromJson(e)).toList();
      print("we are here after fromJson method.");
      print(data);
      billingaddress =
          (jsonResponse.map((e) => BillingAddress.fromJson(e)).toList());
      print("We are here ater mapping billing address");
      print(billingaddress);
    }
  } catch (e) {
    print(e.toString());
  }
  return billingaddress;
}

Future<List<ShippingAdress>> getShippingAddress(int UserID) async {
  late List<ShippingAdress> shippingaddress = [];
  final data;
  try {
    final response = await http.post(
        Uri.parse("http://192.168.50.107:45455/V1/json/data/my-address"),
        //Uri.parse("http://192.168.50.106:5000/products"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode({
          "param": {"USerID": UserID}
        }));
    if (response.statusCode == 200) {
      final jsonResponse =
          json.decode(response.body)['Data']['ShippingAddress'] as List;
      print(jsonResponse);
      data = jsonResponse.map((e) => ShippingAdress.fromJson(e)).toList();
      print("we are here after fromJson method. Ship");
      print(data);
      shippingaddress =
          (jsonResponse.map((e) => ShippingAdress.fromJson(e)).toList());
      print("We are here ater mapping Shipping address");
      print(shippingaddress);
    }
  } catch (e) {
    print(e.toString());
  }
  return shippingaddress;
}

// Future<List<OrderProvider>> getMyOrders(int UserID) async {
//   late List<OrderProvider> myorders = [];
//   final data;
//   try {
//     final response = await http.post(
//         Uri.parse("http://192.168.50.107:45455/V1/json/data/my-orders"),
//         //Uri.parse("http://192.168.50.106:5000/products"),
//         headers: {
//           "Content-type": "application/json",
//           "Accept": "application/json"
//         },
//         body: jsonEncode({
//           "param": {"UserID": UserID}
//         }));
//     if (response.statusCode == 200) {
//       final jsonResponse =
//           json.decode(response.body)['Data']['ShippingAddress'] as List;
//       print(jsonResponse);
//       data = jsonResponse.map((e) => ShippingAdress.fromJson(e)).toList();
//       print("we are here after fromJson method. Ship");
//       print(data);
//       myorders =
//           (jsonResponse.map((e) => ShippingAdress.fromJson(e)).toList());
//       print("We are here ater mapping Shipping address");
//       print(shippingaddress);
//     }
//   } catch (e) {
//     print(e.toString());
//   }
//   return ;
// }

Future<Map<String, OrderItem>> getMyOrders() async {
  //Map<String, OrderItem> myorders = {};
  List<OrderItem> myorders = [];
  Map<String, OrderItem> ret = {};
  print("working on orders");
  try {
    final response = await http.get(
      Uri.parse("http://192.168.50.106:5000/products"),
      //Uri.parse("http://192.168.50.106:5000/products"),
      // headers: {
      //   "Content-type": "application/json",
      //   "Accept": "application/json"
      // },
      // body: jsonEncode({
      //   "param": {"UserID": UserID}
      // })
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(data[1]);
      print(data);
      print("We are in GetMyOrders API");
      myorders.add(OrderItem.fromJson(data));
      var map = Map.fromIterable(myorders,
          key: (e) => e.id,
          value: (e) => {
                'orderNo': e.orderNo,
                'paymentMethod': e.paymentMethod,
                'date': e.date ?? DateTime.now(),
                'shippingAdress': e.shippingAdress,
                'cartItem': e.cartItem,
                'price': e.price
              });
      final type = Map<String, Object>.from(map);
      print(type);
      print("casting");
      //var hello = type as Map<String, OrderItem>;
      final one = type.cast<String, OrderItem>();
      print("hello");
      //print(one);
      ret = one as Map<String, OrderItem>;
      //print(ret1);
      print("mapped");
      //   id: id,
      //   orderNo: orderNumber.toString(),
      //   paymentMethod: paymentMethod,
      //   shippingAdress: shippingAddress,
      //   cartItem: cartitems,
      //   price: price,
      //   date: DateTime.now(),
      //myorders = OrderItem.fromJson(data);
      //data.map((e) => OrderItem.fromJson(e)).toList();
      //OrderItem.fromJson(data);
      // for (Map i in data) {
      //   myorders.add(OrderItem.fromJson(i));
      // }
      // myorders.map(temp);
      // print("printing orders");
      //Map<String, OrderItem>? bb = {temp.id: temp};
      //Map<String, OrderItem>? bb = {for (var value in parse1) value.id: value};
      //
      //print(data["order"]);
      //print(temp.first);
    }
  } catch (e) {
    print(e.toString());
  }
  return ret;
}
