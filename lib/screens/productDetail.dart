// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:another_flushbar/flushbar.dart';
import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/providers/cart_provider.dart';
import 'package:practice_app/providers/products_provider.dart';
import 'package:practice_app/screens/checkout.dart';
import 'package:practice_app/screens/quickBuy.dart';
import 'package:practice_app/widgets/bottomNavBar.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// import '../null-safe packages/flushbar/flushbar.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/product-detail';
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String? id;
  Color starColor = Colors.grey;
  String? size;
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  String? _myQuantitySelection;
  final List<Map> _myJson = [
    {"id": 1, "name": "1"},
    {"id": 2, "name": "2"},
    {"id": 3, "name": "3"},
    {"id": 4, "name": "4"},
  ];
  TextEditingController quantityController = TextEditingController();

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // title = routeArgs['title'];
    // price = routeArgs['price'];
    // imageAsset = routeArgs['imageAsset'];
    id = routeArgs['id'];

    super.didChangeDependencies();
  }

  Color? get colorDecider {
    if (selected1 == true && selected2 == false && selected3 == false) {
      return primary_product_color1;
    } else if (selected1 == false && selected2 == true && selected3 == false) {
      return primary_product_color2;
    } else if (selected1 == false && selected2 == false && selected3 == true) {
      return primary_product_color3;
    } else {
      return null;
    }
  }

  showRemoveFavSnackBar(BuildContext context, String action) async {
    if (action == "Fav") {
      Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        message: 'Item has been removed from Favorites',
        icon: const Icon(
          Icons.info_outline,
          size: 28,
          color: Colors.red,
        ),
        backgroundColor: primary_button_color,
        duration: const Duration(seconds: 2),
        leftBarIndicatorColor: primary_button_color,
      )..show(context).then(
          (value) =>
              Navigator.of(context).pushNamed(MyBottomNavigation.routeName),
        );
    } else if (action == 'unFav') {
      Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        message: 'Item has been added into Favorites',
        icon: const Icon(
          Icons.info_outline,
          size: 28,
          color: Colors.red,
        ),
        backgroundColor: primary_button_color,
        duration: const Duration(seconds: 2),
        leftBarIndicatorColor: primary_button_color,
      )..show(context).then(
          (value) =>
              Navigator.of(context).pushNamed(MyBottomNavigation.routeName),
        );
    }
  }

  showSubmitRequestSnackBarQuickBut(BuildContext context) async {
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      message: "Item has been added to cart.",
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.red,
      ),
      backgroundColor: primary_button_color,
      duration: const Duration(seconds: 1),
      leftBarIndicatorColor: primary_button_color,
    )..show(context).then(
        (r) => Navigator.of(context).pushNamed(Checkout.routeName),
      );
  }

  showSubmitRequestSnackBar(BuildContext context) async {
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      message: "Item has been added to cart.",
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.red,
      ),
      backgroundColor: primary_button_color,
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: primary_button_color,
    )..show(context).then(
        (r) => Navigator.of(context).pushNamed(MyBottomNavigation.routeName),
      );
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(
      context,
      listen: false,
    ).findById(id!);
    final cart = Provider.of<Cart>(context, listen: false);

    void addtoCart() {
      if (size == '' || colorDecider == null || _myQuantitySelection == '') {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Required'),
            content: const Text(
              'Please select proper detail',
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      } else {
        cart.addItem(
          product.id,
          _myQuantitySelection!,
          product.title,
          product.price.toDouble(),
          product.imageAsset,
          size!,
          colorDecider!,
        );
        showSubmitRequestSnackBar(context);
      }
    }

    void gotoQuickBuy() {
      if (size == '' || colorDecider == null || _myQuantitySelection == '') {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Required'),
            content: const Text(
              'Please select proper detail',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      } else {
        cart.addItem(
          product.id,
          _myQuantitySelection!,
          product.title,
          product.price.toDouble(),
          product.imageAsset,
          size!,
          colorDecider!,
        );
        showSubmitRequestSnackBarQuickBut(context);
      }
    }

    print('screen rebuild');

    return Scaffold(
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                centerTitle: true,
                title: const Text("Product Details"),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.solidQuestionCircle),
                    color: Colors.white,
                    onPressed: () {
                      // ignore: deprecated_member_use
                      Scaffold.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Working on it.",
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),
                ],
                backgroundColor: Colors.black,
                bottom: PreferredSize(
                  preferredSize: const Size(0, 20),
                  child: Container(),
                ),
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                flexibleSpace: Stack(
                  // ignore: deprecated_member_use
                  clipBehavior: Clip.none,
                  children: [
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/pgone.jpg")),
                    ),
                    Positioned(
                      top: 135,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          child: const Text(
                            "FREE SHIPPING WORLDWIDE",
                            style: TextStyle(
                              fontFamily: 'Morganite Light',
                              fontSize: 36,
                              color: primary_text_one,
                              letterSpacing: 3.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Center(
                        child: Container(
                          child: Text(
                            '\$${product.price.toInt()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Morganite Bold',
                              fontSize: 120,
                            ),
                          ),
                        ),
                      ),
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 2 - 170,
                      right: MediaQuery.of(context).size.width / 2 - 170,
                      bottom: MediaQuery.of(context).size.width / 2.8 - 410,
                      child: Container(
                        height: 330,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.vertical(
                              top: const Radius.circular(20),
                              bottom: const Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset: const Offset(
                                0,
                                3,
                              ), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topRight,
                              child: Consumer<Products>(
                                builder: (ctx, products, child) => IconButton(
                                  icon: Icon(
                                    product.isFavorite
                                        ? Icons.star
                                        : Icons.star_border,
                                    size: 25,
                                    color: starColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      product.toggleFavoriteStatus();
                                      if (product.isFavorite) {
                                        showRemoveFavSnackBar(context, 'unFav');
                                      } else {
                                        showRemoveFavSnackBar(context, 'Fav');
                                      }
                                    });

                                    // setState(
                                    //   () {
                                    //
                                    //   },
                                    // );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              height: 270,
                              child: Image(
                                image: AssetImage(product.imageAsset),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 180),
                    Container(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        children: <Widget>[
                          Text(
                            product.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'PlayFairDisplay',
                              fontSize: 50,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Gardening',
                            style: TextStyle(
                              fontFamily: 'PlayFairDisplay',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: const Text(
                                "Aenean vel leo eget massa sollicitudin placerat non ut est. Donec enim augue, pellentesque et sapien non, vehicula pretium nisi. Mauris scelerisque interdum libero.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display Light',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: const Text(
                          "In Stock",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'PlayFairDisplay',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: const Text(
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
                        left: 20.0,
                        right: 20.0,
                        top: 10,
                      ),
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 10),
                          child: CustomRadioButton(
                            elevation: 1,
                            height: 60,
                            width: 120,
                            selectedBorderColor: Colors.white,
                            unSelectedBorderColor: Colors.black,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Colors.white,
                            buttonLables: const [
                              'S',
                              'L',
                              'XL',
                            ],
                            buttonValues: const [
                              "Small",
                              "Large",
                              "Extra Large",
                            ],
                            buttonTextStyle: const ButtonTextStyle(
                                selectedColor: Colors.black,
                                unSelectedColor: Colors.black,
                                textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
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
                            const Text(
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
                                height: 50,
                                width: MediaQuery.of(context).size.width / 0.7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: selected1 == true ? 50 : 45,
                                      width: selected1 == true ? 110 : 110,
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            selected1 = !selected1;
                                            selected2 = false;
                                            selected3 = false;
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  primary_product_color1),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.all(8)),
                                        ),
                                        child: Container(),
                                      ),
                                    ),
                                    Container(
                                      height: selected2 == true ? 70 : 55,
                                      width: selected2 == true ? 110 : 110,
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            selected1 = false;
                                            selected2 = !selected2;
                                            selected3 = false;
                                          });
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primary_product_color2),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(8))),
                                        child: Container(),
                                      ),
                                    ),
                                    Container(
                                      height: selected3 == true ? 70 : 55,
                                      width: selected3 == true ? 120 : 120,
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            selected1 = false;
                                            selected2 = false;
                                            selected3 = !selected3;
                                          });
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primary_product_color3),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(8))),
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
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: const Text(
                                "Quantity",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'PlayFairDisplay',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 370,
                                    height: MediaQuery.of(context).size.height,
                                    decoration: const BoxDecoration(
                                        color: primary_background_one),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          isDense: true,
                                          hint: const Text(
                                            "Select quantity of plants",
                                            style: const TextStyle(
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                          value: _myQuantitySelection,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _myQuantitySelection = newValue;
                                            });

                                            print(_myQuantitySelection);
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 185,
                              decoration: const BoxDecoration(
                                  color: primary_background_one),
                              child: FlatButton(
                                onPressed: () {
                                  addtoCart();
                                },
                                child: const Text(
                                  "ADD TO CART",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'PlayFairDisplay',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 185,
                              decoration:
                                  const BoxDecoration(color: primary_text_two),
                              child: FlatButton(
                                onPressed: () {
                                  gotoQuickBuy();
                                },
                                child: const Text(
                                  "QUICK BUY",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'PlayFairDisplay',
                                  ),
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(
                            new SnackBar(
                              content: new Text('Save Later.. '),
                            ),
                          );
                        },
                        child: const Text(
                          'or Save Later',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'PlayFairDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
