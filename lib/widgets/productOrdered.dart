import 'package:practice_app/constant/constant_color.dart';

import 'package:practice_app/models/invoice.dart';
import 'package:practice_app/providers/cart_provider.dart';

import 'package:practice_app/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOrdered extends StatelessWidget {
  const ProductOrdered({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Map<String, CartItem> cart;

  @override
  Widget build(BuildContext context) {
    final cartItems = cart;

    return Column(
      children: [
        ListView.builder(
          itemCount: cartItems.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (index % 2 == 0) {
              return Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 35.0),
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: primary_background_six,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        '${cartItems.values.toList()[index].imageAssets}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 10),
                                        child: Divider(
                                          color: cartItems.values
                                              .toList()[index]
                                              .color,
                                          thickness: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "\$ ${cartItems.values.toList()[index].price!.toInt()}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Morganite ExtraBold',
                                            fontSize: 48,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "${cartItems.values.toList()[index].title}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'PlayFairDisplay',
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Text(
                                            "x${cartItems.values.toList()[index].quantity}",
                                            style: TextStyle(
                                              fontFamily:
                                                  'SF Pro Display Light',
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          child: Text(
                                            "${cartItems.values.toList()[index].size}",
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display Bold',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "\$ ${cartItems.values.toList()[index].price!.toInt()}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Morganite ExtraBold',
                                            fontSize: 48,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "${cartItems.values.toList()[index].title}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'PlayFairDisplay',
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Text(
                                            "x${cartItems.values.toList()[index].quantity}",
                                            style: TextStyle(
                                              fontFamily:
                                                  'SF Pro Display Light',
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          child: Text(
                                            "${cartItems.values.toList()[index].size}",
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display Bold',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 20),
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: primary_background_six,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(right: 20, top: 20),
                                      child: Image.asset(
                                        '${cartItems.values.toList()[index].imageAssets}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 30),
                                        child: Divider(
                                          color: cartItems.values
                                              .toList()[index]
                                              .color,
                                          thickness: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 70,
            width: 500,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: RaisedButton(
              color: primary_background_one,
              child: Text(
                'Keep Shopping',
                style: TextStyle(
                    color: primary_background_two,
                    fontSize: 20.0,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => MyBottomNavigation(),
                  ),
                  ModalRoute.withName('/navigation-page'),
                );
                Provider.of<Cart>(context).emptyCart();
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
