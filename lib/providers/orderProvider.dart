import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practice_app/models/orderClass.dart';
import 'package:practice_app/models/shippingAdress.dart';
import 'package:practice_app/providers/api.dart';

import 'cart_provider.dart';

class OrderProvider with ChangeNotifier {
  Map<String, OrderItem> _order = {};
  final _random = Random();
  fetchOrders(context) async {
    _order = await getMyOrders() as Map<String, OrderItem>;
    print("OOOOOOOOOrrrrrddderrrsss");
    //print(_order);
  }
  // fetchBillAddress(context, int UserID) async {
  //   //UserID = await getSharedPreferences();
  //   _order = await getMyOrders();
  // }

  Map<String, OrderItem> get orders {
    return {..._order};
  }

  List<int> get orderNumber {
    var orderno = new List.generate(9, (_) => _random.nextInt(100));
    return orderno;
  }

  OrderItem findById(String id) {
    return _order.values.toList().firstWhere((element) => element.id == id);
  }

  void removeOrder(String id) {
    _order.removeWhere((key, value) => value.id == id);
    notifyListeners();
  }

  void addOrder(
    String id,
    String paymentMethod,
    ShippingAdress shippingAddress,
    Map<String, CartItem> cartitems,
    int price,
  ) {
    _order.putIfAbsent(
      orderNumber.toString(),
      () => OrderItem(
        id: id,
        orderNo: orderNumber.toString(),
        paymentMethod: paymentMethod,
        shippingAdress: shippingAddress,
        cartItem: cartitems,
        price: price,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
