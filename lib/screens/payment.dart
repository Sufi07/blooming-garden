import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/providers/address_provider.dart';
import 'package:practice_app/providers/cart_provider.dart';
import 'package:practice_app/providers/orderProvider.dart';
import 'package:practice_app/screens/invoice.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../null-safe packages/date_time_picker/date_time_picker_package.dart';
import '../null-safe packages/date_time_picker/validate_date_class.dart';

class Paymentt extends StatefulWidget {
  static const routeName = '/payment-screen';
  @override
  _PaymenttState createState() => _PaymenttState();
  static final now = DateTime.now();

  final dropdownDatePicker = DropdownDatePicker(
    firstDate: ValidDate(year: now.year - 10, month: 1, day: 1),
    lastDate: ValidDate(year: now.year, month: now.month, day: now.day),
    textStyle: const TextStyle(
      fontFamily: 'PlayFairDisplay',
    ),
  );
}

class _PaymenttState extends State<Paymentt> {
  String? paymentMethod;
  bool _selected1 = false, _selected2 = false;
  String? _myYearSelection, _myMonthSelection;
  final List<Map> _myJson = [
    {"id": 0, "name": "2020"},
    {"id": 1, "name": "2021"},
    {"id": 2, "name": "2022"},
    {"id": 3, "name": "2023"},
  ];
  final List<Map> _myJson1 = [
    {"id": 0, "name": "January"},
    {"id": 1, "name": "February"},
    {"id": 2, "name": "March"},
    {"id": 3, "name": "April"},
    {"id": 4, "name": "May"},
    {"id": 5, "name": "June"},
    {"id": 6, "name": "July"},
    {"id": 7, "name": "August"},
    {"id": 8, "name": "September"},
    {"id": 9, "name": "October"},
    {"id": 10, "name": "November"},
    {"id": 11, "name": "December"},
  ];

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    paymentMethod = routeArgs['payment'];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final shippingAddress =
        Provider.of<AddressProvider>(context, listen: false).firstShipData();
    final cartData = Provider.of<Cart>(context, listen: false);
    final orderProvider = Provider.of<OrderProvider>(context);
    final cart = cartData.items;
    return Scaffold(
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesomeIcons.solidQuestionCircle),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
                backgroundColor: Colors.black,
                bottom: PreferredSize(
                  child: Container(),
                  preferredSize: Size(0, 20),
                ),
                expandedHeight: MediaQuery.of(context).size.height * 0.2555,
                flexibleSpace: Stack(
                  children: [
                    Positioned(
                      bottom: -1,
                      left: 0,
                      right: 0,
                      top: 100,
                      child: Container(
                        child: Text(
                          '\$ ${Provider.of<Cart>(context, listen: false).totalAmount.toInt()}',
                          style: TextStyle(
                            fontSize: 72,
                            fontFamily: 'Morganite Bold',
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                      ),
                      bottom: -1,
                      left: 0,
                      right: 0,
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Payment Method',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  color: paymentMethod == 'Paypal'
                                      ? primary_background_four
                                      : primary_background_five,
                                  onPressed: () {},
                                  child: Container(
                                    height: 90,
                                    width: 135,
                                    child: Image.asset(
                                      "assets/images/paypal.png",
                                      width: 80,
                                      height: 101,
                                    ),
                                  ),
                                ),
                                RaisedButton(
                                  color: paymentMethod == 'Visa'
                                      ? primary_background_four
                                      : primary_background_five,
                                  onPressed: () {},
                                  child: Container(
                                    height: 90,
                                    width: 170,
                                    child: Image.asset(
                                      "assets/images/visa.png",
                                      width: 80,
                                      height: 101,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Cardholding Name',
                                    style: TextStyle(
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Container(
                              height: 60,
                              decoration:
                                  BoxDecoration(color: primary_background_one),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Douglas E. Carter',
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Card Number',
                                    style: TextStyle(
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Container(
                              height: 60,
                              decoration:
                                  BoxDecoration(color: primary_background_one),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 55,
                                    width: 250,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      maxLength: 14,
                                      textAlign: TextAlign.center,
                                      autofocus: false,
                                      enabled: false,
                                      initialValue: '',
                                      decoration: InputDecoration(
                                        hintText: 'Enter 14 Digit Number',
                                        counterText: "",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  // '01234 4567 8961 4623 123',
                                  // style: TextStyle(
                                  //     fontFamily:
                                  //     'SF Pro Display Light',
                                  //     fontSize:
                                  //     16),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Expire Date',
                                    style: TextStyle(
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 190,
                                    height: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                        color: primary_background_one),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          isDense: true,
                                          hint: Text(
                                            "Year",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          value: _myYearSelection,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _myYearSelection = newValue;
                                            });

                                            if (kDebugMode) {
                                              print(_myYearSelection);
                                            }
                                          },
                                          items: _myJson.map((Map map) {
                                            return new DropdownMenuItem<String>(
                                              value: map["id"].toString(),
                                              child: new Text(
                                                map["name"],
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 190,
                                    height: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                        color: primary_background_one),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          isDense: true,
                                          hint: Text(
                                            "Month",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          value: _myMonthSelection,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _myMonthSelection = newValue;
                                            });

                                            print(_myMonthSelection);
                                          },
                                          items: _myJson1.map((Map map) {
                                            return new DropdownMenuItem<String>(
                                              value: map["id"].toString(),
                                              child: new Text(
                                                map["name"],
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 10, left: 20, right: 20),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        'CVV Number',
                                        style: TextStyle(
                                            fontFamily: 'PlayfairDisplay',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      // Text(
                                      //   'CVV Number',
                                      //   style: TextStyle(
                                      //       fontFamily: 'PlayfairDisplay',
                                      //       fontWeight: FontWeight.bold,
                                      //       fontSize: 16),
                                      // ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          height: 55,
                                          width: 340,
                                          decoration: BoxDecoration(
                                              color: primary_background_one),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            maxLength: 3,
                                            textAlign: TextAlign.center,
                                            autofocus: false,
                                            initialValue: '',
                                            decoration: InputDecoration(
                                              hintText: 'Enter CVV Code',
                                              counterText: "",
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      20.0, 15.0, 20.0, 10.0),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        // Container(
                                        //   height: 55,
                                        //   width: 190,
                                        //   decoration: BoxDecoration(
                                        //       color: primary_background_one),
                                        //   child: TextFormField(
                                        //     keyboardType: TextInputType.number,
                                        //     maxLength: 7,
                                        //     textAlign: TextAlign.center,
                                        //     autofocus: false,
                                        //     initialValue: '',
                                        //     decoration: InputDecoration(
                                        //       hintText: 'Enter Zip Code',
                                        //       counterText: "",
                                        //       contentPadding:
                                        //           EdgeInsets.fromLTRB(
                                        //               20.0, 15.0, 20.0, 10.0),
                                        //       border: InputBorder.none,
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10, top: 10),
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  BoxDecoration(color: primary_button_color),
                              child: FlatButton(
                                  onPressed: () {
                                    String id = DateTime.now().toString();
                                    orderProvider.addOrder(
                                      id,
                                      paymentMethod!,
                                      shippingAddress,
                                      cart,
                                      cartData.totalAmount.toInt(),
                                    );
                                    print('done');
                                    Navigator.of(context).pushNamed(
                                        Invoice.routeName,
                                        arguments: {
                                          'id': id,
                                        });
                                    cartData.emptyCart();
                                  },
                                  child: Text(
                                    "PAY NOW",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: 'PlayFairDisplay'),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
