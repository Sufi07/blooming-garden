import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/screens/product_listing.dart';

class Topcategory extends StatefulWidget {
  const Topcategory({
    Key? key,
  }) : super(key: key);

  @override
  _TopcategoryState createState() => _TopcategoryState();
}

class _TopcategoryState extends State<Topcategory> {
  String category = 'Flowering Plants';
  String quantity = '12';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductListing.routeName, arguments: {
          'category': category,
          'quantity': quantity,
        });
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20)),
                        color: primary_background_six),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage(
                          "assets/images/plant1.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(20)),
                        color: primary_background_five),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Column contents vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Column contents horizontally
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Text(
                            "Flowering Plants",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PlayFairDisplay',
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "12 Products",
                              style: TextStyle(
                                fontFamily: 'SF Pro Display Light',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
