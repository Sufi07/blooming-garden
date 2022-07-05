
import 'package:flutter/material.dart';
import 'package:practice_app/constant/constant_color.dart';

class Credits extends StatelessWidget {
  static const routeName = '/credit-screen';
  const Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true, // to center the text in app bar
          title: const Text(
            'Credites',
            style: TextStyle(
              fontFamily: 'PlayFairDisplay',
              color: Colors.black,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: primary_icon_one,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    color: primary_text_two,
                    fontFamily: 'PlayFairDisplay',
                    fontWeight: FontWeight.w100,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'This Ecommerce App UI is designed by'),
                    TextSpan(
                      text: ' Hasnat Ali.',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child: const Text(
                'Free for commercial use.',
                style: TextStyle(
                  fontSize: 15,
                  color: primary_text_two,
                  fontFamily: 'PlayFairDisplay',
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    color: primary_text_two,
                    fontFamily: 'PlayFairDisplay',
                    fontWeight: FontWeight.w100,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Stock Photos are from '),
                    TextSpan(
                      text: 'Pexels.com & Unsplash.com',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    color: primary_text_two,
                    fontFamily: 'PlayFairDisplay',
                    fontWeight: FontWeight.w100,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Font Icons are from '),
                    TextSpan(
                      text: 'Ionicons',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    color: primary_text_two,
                    fontFamily: 'PlayFairDisplay',
                    fontWeight: FontWeight.w100,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: '3D Plant Pictures are from'),
                    TextSpan(
                      text: ' Freepik.com',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
