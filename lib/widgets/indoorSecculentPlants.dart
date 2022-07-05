import 'dart:convert';

import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/screens/product_listing.dart';
import 'package:flutter/material.dart';

class IndoorSucculentplants extends StatefulWidget {
  @override
  _IndoorSucculentplantsState createState() => _IndoorSucculentplantsState();
}

class _IndoorSucculentplantsState extends State<IndoorSucculentplants> {
  String category = 'Indoor Palm';
  String quanity = '12';
  String category1 = 'Secculant Plant';
  String quantity1 = '12';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductListing.routeName, arguments: {
                  'category': category,
                  'quantity': quanity,
                });
              },
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
                              image: AssetImage("assets/images/plant1.png")),
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
                        decoration:
                            BoxDecoration(color: primary_background_five),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, //Center Column contents vertically,
                          crossAxisAlignment: CrossAxisAlignment
                              .center, //Center Column contents horizontally,
                          children: <Widget>[
                            Container(
                              width: 150,
                              child: Text(
                                category,
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
                                  "$quanity Products",
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
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductListing.routeName, arguments: {
                  'category': category1,
                  'quantity': quantity1,
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        height: 220,
                        decoration:
                            BoxDecoration(color: primary_background_five),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, //Center Column contents vertically,
                          crossAxisAlignment: CrossAxisAlignment
                              .center, //Center Column contents horizontally,
                          children: <Widget>[
                            Container(
                              width: 150,
                              child: Text(
                                category1,
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
                                  "$quantity1 Products",
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
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20)),
                            color: primary_background_six),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                              image: AssetImage("assets/images/plant1.png")),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
