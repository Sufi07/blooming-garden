import 'package:flutter/material.dart';

class ProductList with ChangeNotifier {
  final String id;
  final String title;
  final String imageAsset;
  final num price;
  bool isFavorite;

  ProductList({
    required this.id,
    required this.title,
    required this.price,
    required this.imageAsset,
    this.isFavorite = false,
  });
  factory ProductList.fromMap(Map<String, dynamic> json) {
    return ProductList(
        id: json['ProductID'].toString(),
        title: json['ProductName'],
        imageAsset: json['ImageUrl'],
        price: json['Price']);
  }
  factory ProductList.fromJson(Map<String, dynamic> json) {
    print('Json:');
    print(json);
    return ProductList(
        id: json['ProductID'].toString(),
        title: json['ProductName'] ?? '',
        imageAsset: json['ImageUrl'] ?? '',
        price: json['Price'] ?? 0);
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
