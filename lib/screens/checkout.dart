// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/providers/address_provider.dart';
import 'package:practice_app/providers/cart_provider.dart';
import 'package:practice_app/screens/payment.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'myAdresses.dart';

class Checkout extends StatefulWidget {
  static const routeName = '/checkout-screen';
  Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool _selected1 = false, _selected2 = false;
  String payment = "";
  late SharedPreferences preferences;
  String userID = "";
  int id = 0;
  Future<void> getSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
    userID = await preferences.getString('userData') ?? 'data not found';
    final data = jsonDecode(userID);
    id = data["userId"];
  }

  @override
  Widget build(BuildContext context) {
    final billingAddress = Provider.of<AddressProvider>(context);
    billingAddress.fetchBillAddress(context, id);
    final shippingData = Provider.of<AddressProvider>(context);
    shippingData.fetchShipAddress(context, id);
    Future<void> gotoPayment(String payment) async {
      if (shippingData.firstData().address == "" ||
          billingAddress.firstData().address == "") {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Shipping Address could not find.'),
            content: const Text(
              'Do you want to enter the address now?',
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: const Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(MyAdress.routeName);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      } else {
        Navigator.of(context).pushNamed(Paymentt.routeName, arguments: {
          'payment': payment,
        });
      }
    }

    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: new IconButton(
                    icon: new Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.solidQuestionCircle),
                      color: Colors.white,
                      onPressed: () {},
                      iconSize: 20,
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size(0, 20),
                    child: Container(),
                  ),
                  pinned: false,
                  expandedHeight: MediaQuery.of(context).size.height * 0.3,
                  flexibleSpace: Stack(
                    children: [
                      const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/pgone.jpg"))),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Center(
                          child: Container(
                            child: const Text(
                              "Checkout",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Morganite Bold',
                                  fontSize: 75),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -1,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Payment Summary',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Billing Address',
                                      style: TextStyle(
                                          fontFamily: 'PlayFairDisplay',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: primary_background_five,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                billingAddress.firstData().name,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color:
                                                        primary_background_two,
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                billingAddress
                                                    .firstData()
                                                    .address,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color:
                                                        primary_background_two,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        'SF Pro Display Light'),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
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
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 20),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Shipping Address',
                                        style: TextStyle(
                                            fontFamily: 'PlayFairDisplay',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            shippingData.shipsAdd.isEmpty
                                ? const Text('Please add shipping address.')
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20),
                                    child: Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        color: primary_background_five,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      shippingData
                                                          .firstShipData()
                                                          .name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          color:
                                                              primary_background_two,
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'SF Pro Display Bold',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      shippingData
                                                          .firstShipData()
                                                          .adress,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          color:
                                                              primary_background_two,
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'SF Pro Display Light'),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
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
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      'Coupon',
                                      style: TextStyle(
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                    color: primary_background_one),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    SizedBox(
                                      height: 55,
                                      width: 250,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        maxLength: 7,
                                        textAlign: TextAlign.start,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                          suffixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                left: 30, top: 10.0),
                                            child: Icon(FontAwesomeIcons.tag,
                                                color: primary_text_two,
                                                size: 18.0),
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              left: 20.0,
                                              top: 20.0,
                                              bottom: 10),
                                          hintText: 'Enter your Coupon Code',
                                          counterText: "",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                color: primary_background_five,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text(
                                          "Discount",
                                          style: TextStyle(
                                            fontFamily: 'PlayFairDisplay',
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        const Text(
                                          "\%0",
                                          style: TextStyle(
                                              fontFamily: 'Morganite Light',
                                              fontSize: 48),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text(
                                          "Total",
                                          style: TextStyle(
                                              fontFamily: 'PlayFairDisplay',
                                              fontSize: 20),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          '\$ ${cart.totalAmount.toInt()}',
                                          style: const TextStyle(
                                              fontFamily: 'Morganite ExtraBold',
                                              fontSize: 48,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 3, top: 5),
                                    child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          color: primary_text_two),
                                      child: FlatButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (dialogContext) =>
                                                editPaymentDialog(
                                              dialogContext,
                                            ),
                                          )..then(
                                              (value) => gotoPayment(payment));
                                          print(payment);
                                        },
                                        child: const Text(
                                          "GO TO PAYMENT",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              fontFamily: 'PlayFairDisplay'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
      ),
    );
  }

  Widget editPaymentDialog(
    context,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(0.0),
          content: Container(
            height: 250.0,
            width: screenSize.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Change Payment Method",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayFairDisplay',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      width: screenSize.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: _selected1
                                ? primary_background_four
                                : primary_background_five,
                            onPressed: () {
                              setState(() {
                                _selected1 = !_selected1;
                                _selected2 = false;
                              });
                            },
                            child: Image.asset(
                              "assets/images/Cod.png",
                              width: 80,
                              height: 101,
                            ),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          RaisedButton(
                            color: _selected2
                                ? primary_background_four
                                : primary_background_five,
                            onPressed: () {
                              setState(() {
                                _selected1 = false;
                                _selected2 = !_selected2;
                              });
                            },
                            child: Image.asset(
                              "assets/images/visa.png",
                              width: 80,
                              height: 101,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  FlatButton(
                    onPressed: () {
                      changePaymentMethod(context);
                    },
                    child: Container(
                      height: 44.0,
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Center(
                        child: Text(
                          "Done",
                          style: TextStyle(
                            fontFamily: 'PlayFairDisplay',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void changePaymentMethod(context) async {
    if (_selected1 == true && _selected2 == false) {
      setState(() {
        payment = "COD";
      });
    } else {
      setState(() {
        payment = "Visa";
      });
    }
    Navigator.pop(context);
  }
}
