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
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    print('Json:');
    print(json);
    print(json['order'][0]);
    print(json['order'][1]);
    //tempite
    final temp = json['order'].map((e) => CartItem.fromJson(e));
    Map<String, CartItem>? bb = {for (var value in temp) value.id: value};
    final tempadd =
        ShippingAdress.fromJson(json['shippingAddress']) as ShippingAdress;
    print("printing temp items");
    print(temp.toString());
    print("temp address");
    bb.forEach((key, value) {
      print('$key, $value');
    });
    //print(tempadd);
    return OrderItem(
        id: json['ProductID'].toString(),
        orderNo: json['orderNO'].toString(),
        date: json['Date'],
        paymentMethod: json['paymentMethod'],
        shippingAdress: tempadd,
        cartItem: bb,
        price: json["price"]);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['ProductID'] = this.id;
  //   data['OrderNO'] = this.orderNo;
  //   data['Date'] = this.date;
  //   data['paymentMethod'] = this.paymentMethod;
  //   data['shippingAddress'] = this.shippingAdress;
  //   data['order'] = this.cartItem;
  //   data["price"] = this.price;
  //   return data;
  // }
}
