// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BillingAddress with ChangeNotifier {
  final int id;
  final String name;
  final String address;

  BillingAddress({
    required this.id,
    required this.name,
    required this.address,
  });

// ignore: non_constant_identifier_names
  factory BillingAddress.fromJson(Map<String, dynamic> json) {
    print('Json:');
    print(json);
    return BillingAddress(
      id: json["ID"] ?? 0,
      name: json['FullName'] ?? "",
      address: json['BillingAddress'] ?? '',
    );
  }
}
