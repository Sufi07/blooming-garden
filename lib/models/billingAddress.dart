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
}
