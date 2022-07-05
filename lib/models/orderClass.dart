
import 'package:flutter/cupertino.dart';
import 'package:practice_app/models/shippingAdress.dart';
import 'package:practice_app/providers/cart_provider.dart';

class OrderItem with ChangeNotifier {
  final String? id;
  final String? orderNo;
  final DateTime? date;
  final String? paymentMethod;
  final ShippingAdress? shippingAdress;
  final Map<String, CartItem>? cartItem;
  final int? price;

  OrderItem({
    this.id,
    this.orderNo,
    this.date,
    this.paymentMethod,
    this.shippingAdress,
    this.cartItem,
    this.price,
  });
}
