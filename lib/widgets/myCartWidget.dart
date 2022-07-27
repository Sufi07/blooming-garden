import 'package:practice_app/constant/constant_color.dart';

import 'package:practice_app/providers/cart_provider.dart';

import 'package:practice_app/screens/updateCartScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartWidget extends StatefulWidget {
  final Map<String, CartItem> cartItems;

  MyCartWidget(this.cartItems);

  @override
  _MyCartWidgetState createState() => _MyCartWidgetState();
}

class _MyCartWidgetState extends State<MyCartWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.cartItems.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Column(
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
                          padding: EdgeInsets.only(left: 30.0),
                          child: Container(
                            height: 165,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primary_background_six,
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            "${widget.cartItems.values.toList()[index].imageAssets}",
                            fit: BoxFit.cover,
                          ),
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
                              bottomRight: Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "\$ ${widget.cartItems.values.toList()[index].price!.toInt()}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Morganite Bold',
                                    fontSize: 48,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "${widget.cartItems.values.toList()[index].title}",
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
                                    "x${widget.cartItems.values.toList()[index].quantity}",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display Light',
                                      fontSize: 15,
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
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Size',
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Color',
                          style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        'Quantity',
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        '${widget.cartItems.values.toList()[index].size}',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: primary_background_five,
                      height: 60,
                      minWidth: 109,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Container(),
                      color: widget.cartItems.values.toList()[index].color,
                      height: 60,
                      minWidth: 109,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        '${widget.cartItems.values.toList()[index].quantity}',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: primary_background_five,
                      height: 60,
                      minWidth: 109,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            UpdateCartScreen.routeName,
                            arguments:
                                widget.cartItems.values.toList()[index].id);
                      },
                      child: Text('Update'),
                      color: primary_background_one,
                      height: 72,
                      minWidth: 254,
                    ),
                    FlatButton(
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false).removeItem(
                          widget.cartItems.keys.toList()[index],
                        );
                      },
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Provider.of<Cart>(context, listen: false).removeItem(
                            widget.cartItems.keys.toList()[index],
                          );
                        },
                      ),
                      color: primary_background_five,
                      height: 72,
                      minWidth: 72,
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 58.0, vertical: 20.0),
            child: SizedBox(
              height: 20.0,
              child: Divider(
                color: primary_background_two,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
