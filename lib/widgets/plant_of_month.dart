import 'dart:io';

import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/screens/productDetail.dart';
import 'package:practice_app/screens/product_listing.dart';
import 'package:flutter/material.dart';

class Plantofmonth extends StatefulWidget {
  @override
  _PlantofmonthState createState() => _PlantofmonthState();
}

class _PlantofmonthState extends State<Plantofmonth> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetail.routeName,
          arguments: {
            'id': 'p7',
          },
        );
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image(
                image: AssetImage(
                  'assets/images/plantofmonth.jpg',
                ),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  child: Text('Error! \n In finding image.'),
                ),
              ),
            ),
            Container(
              child: Text(
                "Peperomia",
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  "\$35",
                  style: TextStyle(
                    fontFamily: 'Morganite Bold',
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Platform.isIOS
                ? Container(
                    child: FlatButton(
                      color: primary_text_two,
                      textColor: primary_text_one,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 110, vertical: 20.0),
                        child: Text(
                          'DISCOVER NOW',
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'PlayfairDisplay'),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          ProductDetail.routeName,
                          arguments: {
                            'id': 'p7',
                          },
                        );
                      },
                    ),
                  )
                : Container(
                    child: FlatButton(
                      color: primary_text_two,
                      textColor: primary_text_one,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 110, vertical: 20.0),
                        child: Text(
                          'DISCOVER NOW',
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'PlayfairDisplay'),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          ProductDetail.routeName,
                          arguments: {
                            'id': 'p7',
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
