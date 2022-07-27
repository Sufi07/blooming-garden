import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/providers/address_provider.dart';
import 'package:practice_app/models/invoice.dart';
import 'package:practice_app/providers/cart_provider.dart';
import 'package:practice_app/providers/orderProvider.dart';
import 'package:practice_app/widgets/bottomNavBar.dart';
import 'package:practice_app/widgets/productOrdered.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dummy_data.dart';

class Invoice extends StatefulWidget {
  static const routeName = '/invoice-screen';
  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  String? id;
  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    id = routeArgs['id']!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orderData = Provider.of<OrderProvider>(context).findById(id!);
    print("order data here");
    print(orderData);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: new Text(
          'Invoice',
          style: TextStyle(fontFamily: 'PlayFairDisplay', color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            cart.emptyCart();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (ctx) => MyBottomNavigation(),
              ),
              ModalRoute.withName('/navigation-page'),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Text(
                    "Thank you for your order !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'PlayFairDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  child: Text(
                    'Your Invoice',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          'Order Number',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: primary_background_five,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      orderData.orderNo ?? '',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          'Date',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: primary_background_five,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      orderData.date.toString(),
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          'Payment Method',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: primary_background_five,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      orderData.paymentMethod ?? '',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          'Shipping To',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      orderData.shippingAdress == null
                          ? Text('Please add shipping address.')
                          : Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: primary_background_five,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                orderData.shippingAdress!.name,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
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
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                orderData
                                                    .shippingAdress!.adress,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              ProductOrdered(
                cart: orderData.cartItem!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
