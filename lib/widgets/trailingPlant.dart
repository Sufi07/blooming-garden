import 'dart:convert';

import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/models/product.dart';
import 'package:practice_app/providers/products_provider.dart';
import 'package:practice_app/screens/product_listing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Trailingplants extends StatelessWidget {
  String category = 'Trailing';
  String quantity = '36';
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items.toString();

    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductListing.routeName, arguments: {
            'category': category,
            'quantity': quantity,
          });
        },
        child: Container(
          height: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primary_background_one,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  category,
                  style: TextStyle(
                      fontFamily: 'PlayFairDisplay',
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Text(
                "$quantity Products",
                style:
                    TextStyle(fontFamily: 'SF Pro Display Light', fontSize: 16),
              ),
              Container(
                  height: 220,
                  width: 220,
                  child: Image(image: AssetImage("assets/images/plant2.png")))
            ],
          ),
        ),
      ),
    );
  }
}
