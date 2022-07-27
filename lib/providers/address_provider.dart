// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice_app/models/billingAddress.dart';
import 'package:practice_app/models/shippingAdress.dart';
import 'package:practice_app/providers/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  fetchShipAddress(context, int UserID) async {
    UserID = await getSharedPreferences();
    _shipsAdd = await getShippingAddress(UserID);
    print(_shipsAdd.length);
    print("ship data");
  }

  late SharedPreferences preferences;
  int id = 0;
  String userID = "";
  Future<int> getSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
    userID = await preferences.getString('userData') ?? 'data not found';
    final data = jsonDecode(userID);
    final id = int.parse(data["userId"]);
    print("in shared preferences");
    return id;
  }

  late List<BillingAddress> _billAdd = [];
  fetchBillAddress(context, int UserID) async {
    UserID = await getSharedPreferences();
    _billAdd = await getBillingAddress(UserID);
    print(_billAdd.toString());
    print(UserID);
    print(_billAdd.length);
    print("bill data");
    // [
    //   BillingAddress(
    //     id: 0,
    //     name: 'Mr. William J.Briant',
    //     address: '6170 Peshawar Place',
    //   ),
    // ];
  }

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
