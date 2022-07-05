import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItem {
  String? id;
  String? plantId;
  String? title;
  double? price;
  int? quantity;
  String? imageAssets;
  String? size;
  Color? color;

  CartItem({
    this.id,
    this.plantId,
    this.title,
    this.price,
    this.quantity,
    this.imageAssets,
    this.size,
    this.color,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      plantId: json['plantId'] as String,
      title: json['title'] as String,
      price: json['price'] as double,
      quantity: json['quantity'] as int,
      imageAssets: json['imageAsset'] as String,
      size: json['size'] as String,
      color: json['color'] as Color,
    );
  }

  // List<CartItem> toJson() {
  //   return [
  //     'id': this.id,
  //     'plantId': this.plantId,
  //     'title': this.title,
  //     'price': this.price,
  //     'quantity': this.quantity,
  //     'imageAsset': this.imageAssets,
  //     'size': this.size,
  //     'color': this.color,
  //   ];
  // }

  Map toJson() => {
        'id': this.id,
        'plantId': this.plantId,
        'title': this.title,
        'price': this.price,
        'quantity': this.quantity,
        'imageAsset': this.imageAssets,
        'size': this.size,
        'color': this.color,
      };
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _item = {};

  Map<String, CartItem> get items {
    return {..._item};
  }

  List<CartItem> get cartitem {
    return [..._item.values.toList()];
  }

  int get itemCount {
    return _item.length;
  }

  void emptyCart() {
    _item.clear();
    notifyListeners();
  }

  CartItem findById(String id) {
    return _item.values.toList().firstWhere((element) => element.id == id);
  }

  double get totalAmount {
    double total = 0.0;
    _item.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });

    return total;
  }

  void removeItem(String productId) {
    _item.remove(productId);
    notifyListeners();
  }

  void updateCart(String id, CartItem newCart) {
    // try {
    if (_item.containsKey(id)) {
      _item.update(
        id,
        (value) => CartItem(
          plantId: newCart.plantId,
          id: newCart.id,
          title: newCart.title,
          price: newCart.price,
          quantity: newCart.quantity,
          imageAssets: newCart.imageAssets,
          size: newCart.size,
          color: newCart.color,
        ),
      );
    }
    notifyListeners();
    //   final SharedPreferences prefs = await SharedPreferences.getInstance();
    //   final cartData = json.encode(
    //     {
    //       _item,
    //     },
    //   );
    //   prefs.setString('CartData', cartData);
    // } catch (error) {
    //   throw error;
    // }
  }

  Future<void> addItem(String plantId, String quantity, String title,
      double price, String image, String size, Color color) async {
    int quantityy = quantity == '' ? 1 : int.parse(quantity);

    String sizee = size == 'Small'
        ? 'Small'
        : size == 'Large'
            ? 'Large'
            : size == 'Extra Large'
                ? 'Extra Large'
                : '';
    try {
      if (_item.containsKey(plantId)) {
        //change Quantity
        _item.update(
          plantId,
          (existingCartItem) => CartItem(
            plantId: plantId,
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            imageAssets: existingCartItem.imageAssets,
            quantity: existingCartItem.quantity! + quantityy,
            size: sizee,
            color: color,
          ),
        );
      } else {
        _item.putIfAbsent(
          plantId,
          () => CartItem(
            plantId: plantId,
            id: DateTime.now().toString(),
            title: title,
            price: price,
            imageAssets: image,
            quantity: quantityy,
            size: sizee,
            color: color,
          ),
        );
      }
      print(plantId);
      notifyListeners();

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      //print(${cartitem.first.});
      final cartData = jsonEncode(
        {
          'cartItem': _item.toString(),
        },
      );
      prefs.setString('CartData', cartData);
      print(cartData);
      print('Shared done');
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoFillCart() async {
    final perfs = await SharedPreferences.getInstance();
    if (!perfs.containsKey('CartData')) {
      return false;
    }
    final fetchCartData = perfs.getString('CartData');
    final extractedCartData =
        jsonDecode(fetchCartData!) as Map<String, dynamic>;
    _item = extractedCartData['cartItem'] as Map<String, CartItem>;
    notifyListeners();
    return true;
  }
}
