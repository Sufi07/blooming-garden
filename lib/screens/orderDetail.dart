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

class OrderDetail extends StatefulWidget {
  static const routeName = '/order-detail';
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  String? orderId;
  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    orderId = routeArgs['id'];

    super.didChangeDependencies();
  }

  List<InvoiceData> invoiceData = DummyInvoiceData.map(
    (e) => InvoiceData(
        id: e.id,
        orderNumber: e.orderNumber,
        date: e.date,
        paymentMethod: e.paymentMethod,
        customerName: e.customerName,
        customerAdress: e.customerAdress),
  ).toList();
  @override
  Widget build(BuildContext context) {
    final orderItem = Provider.of<OrderProvider>(context).findById(orderId!);

    final shippingData = orderItem.shippingAdress;
    final cart = orderItem.cartItem;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Order Detail',
          style: TextStyle(fontFamily: 'PlayFairDisplay', color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
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
                padding: const EdgeInsets.all(15),
                child: Container(
                  child: Text(
                    'Your Order',
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
                                      orderItem.orderNo!,
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
                                      orderItem.date.toString(),
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
                                      orderItem.paymentMethod!,
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
                      shippingData == null
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
                                                shippingData.name,
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
                                                shippingData.adress,
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
              Column(
                children: [
                  ListView.builder(
                    itemCount: cart!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
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
                                          padding:
                                              const EdgeInsets.only(left: 35.0),
                                          child: Container(
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: primary_background_six,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                cart.values
                                                    .toList()[index]
                                                    .imageAssets!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30, right: 10),
                                                child: Divider(
                                                  color: primary_background_one,
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
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
                                      child: Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50.0),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Text(
                                                  "\$ ${cart.values.toList()[index].price!.toInt()}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Morganite ExtraBold',
                                                    fontSize: 48,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  "${cart.values.toList()[index].title}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'PlayFairDisplay',
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  child: Text(
                                                    "x ${cart.values.toList()[index].quantity}",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Light',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Container(
                                                  child: Text(
                                                    "${cart.values.toList()[index].size}",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
