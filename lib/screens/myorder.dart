import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/providers/orderProvider.dart';
import 'package:practice_app/screens/orderDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrder extends StatefulWidget {
  static const routeName = '/my-order';
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);
    final orderItems = orderData.orders;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'My Orders',
          style: TextStyle(
            fontFamily: 'PlayFairDisplay',
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: orderItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: ValueKey(orderItems.values.toList()[index].id),
            background: Container(
              color: Theme.of(context).errorColor,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 40,
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
            ),
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Are You Sure?'),
                  content: const Text(
                    'Want to remove this order? \nNote: It will not be removed from backend',
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
                        Navigator.of(ctx).pop(true);
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
            onDismissed: (direction) {
              orderData.removeOrder(
                orderItems.values.toList()[index].id!,
              );
            },
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  OrderDetail.routeName,
                  arguments: {
                    'id': orderItems.values.toList()[index].id.toString(),
                  },
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, top: 25, right: 25),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: (() {
                          if (index.isEven) {
                            return primary_background_one;
                          }
                          return primary_background_five;
                        }()),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 15, right: 15),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text(
                                    'Order Number',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primary_background_two,
                                        fontSize: 15,
                                        fontFamily: 'Playfair Display',
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text(
                                    orderItems.values.toList()[index].orderNo!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: primary_background_two,
                                        fontSize: 15,
                                        fontFamily: 'SF Pro Display Light'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 15, right: 15),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text(
                                    'Date',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primary_background_two,
                                        fontSize: 15,
                                        fontFamily: 'Playfair Display',
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text(
                                    orderItems.values
                                        .toList()[index]
                                        .date
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: primary_background_two,
                                        fontSize: 15,
                                        fontFamily: 'SF Pro Display Light'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Status',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: primary_background_two,
                                      fontSize: 15,
                                      fontFamily: 'Playfair Display',
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  'Delivered',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: primary_background_two,
                                      fontSize: 15,
                                      fontFamily: 'SF Pro Display Light'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 15, right: 15),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text(
                                    'Total',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primary_background_two,
                                        fontSize: 15,
                                        fontFamily: 'Playfair Display',
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text(
                                    orderItems.values
                                        .toList()[index]
                                        .price
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: primary_background_two,
                                        fontSize: 15,
                                        fontFamily: 'SF Pro Display Light'),
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
          );
        },
      ),
    );
  }
}
