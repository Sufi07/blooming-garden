import 'dart:math';

import '../models/product.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class Products with ChangeNotifier {
  late List<ProductList> _items = [];
  fetchData(context) async {
    _items = await getData();
    notifyListeners();
  }

  // final List<ProductList> _items =
  //     // getData() as List<ProductList>;
  //     [
  //   ProductList(
  //       id: 'p1',
  //       title: 'Stagborn',
  //       price: 42.0,
  //       imageAsset: 'assets/images/plant3.png'),
  //   ProductList(
  //     id: 'p2',
  //     title: 'Kentia Plam',
  //     price: 39.0,
  //     imageAsset: 'assets/images/plant1.png',
  //   ),
  //   ProductList(
  //       id: 'p3',
  //       title: 'Sedum',
  //       price: 28.0,
  //       imageAsset: 'assets/images/plant2.png'),
  //   ProductList(
  //     id: 'p4',
  //     title: 'Calathea',
  //     price: 41.0,
  //     imageAsset: 'assets/images/plant4.png',
  //   ),
  //   ProductList(
  //     id: 'p5',
  //     title: 'Sansevieria',
  //     price: 25.0,
  //     imageAsset: 'assets/images/plant5.png',
  //   ),
  //   ProductList(
  //     id: 'p6',
  //     title: 'Asparagus',
  //     price: 44.0,
  //     imageAsset: 'assets/images/pom.png',
  //   ),
  //   ProductList(
  //     id: 'p7',
  //     title: 'Peperomia',
  //     price: 35.0,
  //     imageAsset: 'assets/images/pom.png',
  //   ),
  // ];

  List<ProductList>? listToShow;
  final _random = new Random();

  var _showFavoriteOnly = false;

  List<ProductList> get items {
    if (_showFavoriteOnly) {
      return _items.where((element) => element.isFavorite).toList();
    }
    return [..._items];
  }

  List<ProductList> get featuredItems {
    listToShow =
        new List.generate(4, (_) => _items[_random.nextInt(_items.length)]);
    return [...listToShow!];
  }

  List<ProductList> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  ProductList findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
