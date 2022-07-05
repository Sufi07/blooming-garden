import 'package:practice_app/constant/constant_color.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forgetpass extends StatefulWidget {
  static const routeName = '/forget-pass-screen';
  @override
  _ForgetpassState createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  // ignore: unused_element
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primary_background_two,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Recover Account Now',
                  style: TextStyle(
                    color: primary_text_one,
                    fontFamily: 'Morganite Bold',
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                    fontSize: 80,
                  ),
                ),
              ),
              Container(
                width: 150.0,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Aenean vel leo eget massa sollicitudin placerat non ut est. Donec enim augue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primary_text_one,
                    fontFamily: 'SF Pro Display Light',
                    fontSize: 15,
                  ),
                  maxLines: 2,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(color: primary_text_one),
                  controller: nameController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.mail_outline,
                        color: primary_text_one, size: 25.0),
                    filled: true,
                    fillColor: primary_background_four,
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: primary_text_one, width: 0.0)),
                    labelStyle: TextStyle(color: primary_text_one),
                    labelText: 'Enter Email Here',
                    errorStyle: TextStyle(
                      color: primary_text_one,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  color: primary_background_one,
                  child: Text(
                    'RECOVER',
                    style: TextStyle(
                      color: primary_background_two,
                      fontSize: 20.0,
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    print(nameController.text);
                    print(passwordController.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
