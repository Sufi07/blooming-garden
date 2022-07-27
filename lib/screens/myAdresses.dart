import 'dart:convert';
import 'dart:io';
import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/screens/newShippingAdress.dart';
import 'package:practice_app/screens/newBillingAddress.dart';
import 'package:practice_app/providers/address_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAdress extends StatefulWidget {
  static const routeName = '/my-addresses';
  const MyAdress({Key? key}) : super(key: key);

  @override
  _MyAdressState createState() => _MyAdressState();
}

class _MyAdressState extends State<MyAdress> {
  static const CupertinoDynamicColor separator = CupertinoDynamicColor(
    debugLabel: 'separator',
    color: Color.fromARGB(73, 60, 60, 67),
    darkColor: Color.fromARGB(153, 84, 84, 88),
    highContrastColor: Color.fromARGB(94, 60, 60, 67),
    darkHighContrastColor: Color.fromARGB(173, 84, 84, 88),
    elevatedColor: Color.fromARGB(73, 60, 60, 67),
    darkElevatedColor: Color.fromARGB(153, 84, 84, 88),
    highContrastElevatedColor: Color.fromARGB(94, 60, 60, 67),
    darkHighContrastElevatedColor: Color.fromARGB(173, 84, 84, 88),
  );
  // void _newAdress(String tdTitle, String tdName, String tdAdress) {
  //   final newAdd = ShippingAdress(
  //     id: addresses.length + 1,
  //     name: tdName,
  //     adress: tdAdress,
  //   );

  //   setState(() {
  //     addresses.add(newAdd);
  //   });
  // }
  late SharedPreferences preferences;
  String userID = "";
  int id = 0;
  Future<void> getSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
    userID = await preferences.getString('userData') ?? 'data not found';
    final data = jsonDecode(userID);
    id = int.parse(data["userId"]);
  }

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    final shippingAdress = Provider.of<AddressProvider>(context);
    shippingAdress.fetchShipAddress(context, id);
    final shippingData = shippingAdress.shipsAdd;

    final billingAddress = Provider.of<AddressProvider>(context);
    billingAddress.fetchBillAddress(context, id);
    final billingData = billingAddress.billAdd;

    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true, // to center the text in app bar
          title: new Text(
            'My Address',
            style: TextStyle(
              fontFamily: 'PlayFairDisplay',
              color: Colors.black,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    clipBehavior: Clip.hardEdge,
                    itemCount: billingData.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Billing Address',
                                style: TextStyle(
                                  fontFamily: 'PlayFairDisplay',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                                left: 20,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10),
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
                                                billingData[index].name,
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
                                                billingData[index].address,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: primary_background_two,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      'SF Pro Display Light',
                                                ),
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
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 70,
                                width: 500,
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: RaisedButton(
                                  color: primary_background_two,
                                  child: Text(
                                    'Edit Billing Address',
                                    style: TextStyle(
                                        color: primary_text_one,
                                        fontSize: 20.0,
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    // _addNewAdress(context);
                                    Navigator.of(context).pushNamed(
                                        AddBillingAddress.routeName,
                                        arguments: billingData[index].id);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: SizedBox(
                      height: 20.0,
                      child: Platform.isIOS
                          ? const Divider(
                              color: Color.fromARGB(73, 60, 60, 67),
                            )
                          : const Divider(
                              color: primary_background_two,
                            ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Shipping Adress',
                      style: TextStyle(
                        fontFamily: 'PlayFairDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  shippingData.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AddShippingaddress.routeName,
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'To add new shipping adress',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'SF Pro Display Light',
                                  color: primary_text_two,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' click here!',
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
                        )
                      : Column(
                          children: [
                            ListView.builder(
                              clipBehavior: Clip.hardEdge,
                              itemCount: shippingData.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Dismissible(
                                  direction: DismissDirection.endToStart,
                                  key: ValueKey(shippingData[index].id),
                                  background: Container(
                                    color: Theme.of(context).errorColor,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 20),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 4,
                                    ),
                                  ),
                                  confirmDismiss: (direction) {
                                    return showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: Text('Are You Sure?'),
                                        content: Text(
                                          'Do you want to remove this address',
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop(false);
                                            },
                                            child: Text('No'),
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop(true);
                                            },
                                            child: Text('Yes'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  onDismissed: (direction) {
                                    Provider.of<AddressProvider>(context,
                                            listen: false)
                                        .removeItem(shippingData[index].id);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 20,
                                            left: 20,
                                            top: 10,
                                            bottom: 10,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            height: 130,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              color: primary_background_five,
                                            ),
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child: Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            shippingData[index]
                                                                .name,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  primary_background_two,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'SF Pro Display Bold',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            shippingData[index]
                                                                .adress,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  primary_background_two,
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  'SF Pro Display Light',
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 70,
                                width: 500,
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: RaisedButton(
                                  color: primary_background_two,
                                  child: Text(
                                    'Add more Shipping Address',
                                    style: TextStyle(
                                        color: primary_text_one,
                                        fontSize: 20.0,
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    // _addNewAdress(context);
                                    Navigator.of(context).pushNamed(
                                      AddShippingaddress.routeName,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
