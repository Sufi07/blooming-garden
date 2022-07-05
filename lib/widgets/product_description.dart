import 'package:practice_app/constant/constant_color.dart';

import 'package:practice_app/screens/my_cart.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  static const routeName = '/product-description';
  const ProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        color: primary_background_one,
        padding: EdgeInsets.only(top: 70),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primary_background_seven,
                  ),
                  child: Image.asset(
                    'assets/images/plant2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 0,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        '\$35',
                        style: TextStyle(
                          fontFamily: 'Morganite ExtraBold',
                          fontSize: 48,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Sedum',
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                //height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Aenean vel leo eget massa sollicitudin placerat non ut est. Donec enim augue, pellentesque et sapien non, vehicula pretium nisi.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 100,
                  softWrap: false,
                  style: TextStyle(
                      fontFamily: 'PlayFairDisplay Light', fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: 70,
              width: 500,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                color: primary_button_color_two,
                child: Text(
                  'Add to cart'.toUpperCase(),
                  style: TextStyle(
                      color: primary_text_one,
                      fontSize: 20.0,
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(MyCart.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
