import 'package:practice_app/constant/constant_color.dart';
import 'package:flutter/material.dart';

class WalkThrough extends StatelessWidget {
  static const routeName = '/walk-through';
  const WalkThrough({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('assets/images/walkthrough.png'),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 300, right: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: primary_background_seven,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                height: 240,
                width: 240,
                child: Image(
                  image: AssetImage('assets/images/plant4.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                child: Text(
                  'Create \nBeautiful\nThings\nEveryday',
                  style: TextStyle(
                    color: primary_text_one,
                    fontFamily: 'Morganite Bold',
                    fontSize: 72,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
