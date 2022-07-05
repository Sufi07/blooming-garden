// ignore_for_file: prefer_final_fields


import 'package:flutter/material.dart';
import 'package:practice_app/models/billingAddress.dart';
import 'package:practice_app/models/shippingAdress.dart';

class AddressProvider with ChangeNotifier {
  List<ShippingAdress> _shipsAdd = [];

  List<ShippingAdress> get shipsAdd {
    return [..._shipsAdd];
  }

  void removeItem(String id) {
    _shipsAdd.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  ShippingAdress findByIdS(String id) {
    return _shipsAdd.firstWhere((element) => element.id == id);
  }

  void addAddress(String id, String name, String address) {
    final newitem = ShippingAdress(
      id: id,
      name: name,
      adress: address,
    );
    _shipsAdd.add(newitem);
    notifyListeners();
  }

  List<BillingAddress> _billAdd = [
    BillingAddress(
      id: 0,
      name: 'Mr. William J.Briant',
      address: '6170 Peshawar Place',
    ),
  ];

  List<BillingAddress> get billAdd {
    return [..._billAdd];
  }

  BillingAddress firstData() {
    return _billAdd.first;
  }

  ShippingAdress firstShipData() {
    return _shipsAdd.first;
  }

  BillingAddress findByIdB(int id) {
    return _billAdd.firstWhere((element) => element.id == id);
  }

  void updateBillingAddress(int id, BillingAddress newAddress) {
    final addressIndex = _billAdd.indexWhere((billadd) => billadd.id == id);
    if (addressIndex == 0) {
      _billAdd[addressIndex] = newAddress;
      notifyListeners();
    } else {
      print('error found in provider');
    }
  }
}
