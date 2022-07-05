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
        id: json['id'],
        title: json['title'],
        imageAsset: json['imageAsset'],
        price: json['price']);
  }
  factory ProductList.fromJson(Map<String, dynamic> json) {
    print('Json:');
    print(json);
    return ProductList(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        imageAsset: json['imageAsset'] ?? '',
        price: json['price'] ?? 0);
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
