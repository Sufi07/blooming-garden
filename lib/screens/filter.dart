// ignore_for_file: deprecated_member_use

import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/widgets/dropdownWidget.dart';
import 'package:practice_app/widgets/slideRangeWidget.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  static const routeName = '/filter-screen';
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  String? size;
  Color get colorDecider {
    if (selected1 == true && selected2 == false && selected3 == false) {
      return primary_product_color1;
    } else if (selected1 == false && selected2 == true && selected3 == false) {
      return primary_product_color2;
    } else {
      return primary_product_color3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true, // to center the text in app bar
        title: new Text(
          'Filter UI',
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Filter by Type',
                  style: TextStyle(
                    fontFamily: 'PlayFairDisplay',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: DropDown(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Filter by Keywords',
                  style: TextStyle(
                      fontFamily: 'PlayFairDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                color: primary_background_five,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 3),
                  child: TextField(
                    style: TextStyle(color: primary_text_two),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search,
                          color: primary_text_two, size: 23.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: primary_background_five,
                      hintStyle:
                          TextStyle(color: primary_text_two, fontSize: 17.0),
                      hintText: 'Enter your keywords',
                      errorStyle: TextStyle(
                        fontSize: 20.0,
                        color: primary_text_one,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Filter by Price Range',
                  style: TextStyle(
                    fontFamily: 'PlayFairDisplay',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Filterbyrange(),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    "Size",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'PlayFairDisplay',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 60.0,
                  right: 20.0,
                  top: 10,
                ),
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 10),
                    child: CustomRadioButton(
                      elevation: 1,
                      height: 60,
                      selectedBorderColor: Colors.white,
                      unSelectedBorderColor: Colors.black,
                      absoluteZeroSpacing: true,
                      unSelectedColor: Colors.white,
                      buttonLables: [
                        'S',
                        'L',
                        'XL',
                      ],
                      buttonValues: [
                        "Small",
                        "Large",
                        "Extra Large",
                      ],
                      buttonTextStyle: ButtonTextStyle(
                          selectedColor: Colors.black,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(fontSize: 16)),
                      radioButtonValue: (value) {
                        print(value);
                        size = value as String;
                      },
                      selectedColor: Colors.black26,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Color',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'PlayFairDisplay',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 10,
                        ),
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: selected1 == true ? 70 : 55,
                                width: selected1 == true ? 120 : 100,
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      selected1 = !selected1;
                                      selected2 = false;
                                      selected3 = false;
                                    });
                                  },
                                  color: primary_product_color1,
                                  padding:const EdgeInsets.all(8),
                                  child: Container(),
                                ),
                              ),
                              Container(
                                height: selected2 == true ? 70 : 55,
                                width: selected2 == true ? 120 : 100,
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      selected1 = false;
                                      selected2 = !selected2;
                                      selected3 = false;
                                    });
                                  },
                                  color: primary_product_color2,
                                  padding: EdgeInsets.all(8),
                                  child: Container(),
                                ),
                              ),
                              Container(
                                height: selected3 == true ? 70 : 55,
                                width: selected3 == true ? 120 : 100,
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      selected1 = false;
                                      selected2 = false;
                                      selected3 = !selected3;
                                    });
                                  },
                                  color: primary_product_color3,
                                  padding: EdgeInsets.all(8),
                                  child: Container(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
