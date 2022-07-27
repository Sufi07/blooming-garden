import 'package:practice_app/constant/constant_color.dart';

import 'package:flutter/material.dart';

class QuickBuy extends StatelessWidget {
  static const routeName = '/quick-buy';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true, // to center the text in app bar
        title: new Text(
          'Quick Buy',
          style: TextStyle(fontFamily: 'PlayFairDisplay', color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black, // add custom icons also
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: RichText(
                  text: TextSpan(
                    text: 'This Page is Under development ',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'SF Pro Display Light',
                      color: primary_text_two,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Fyp Team',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'SF Pro Display Light',
                          color: primary_text_two,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
