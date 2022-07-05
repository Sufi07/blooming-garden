import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/screens/product_listing.dart';
import 'package:practice_app/providers/cart_provider.dart';
import 'package:practice_app/screens/checkout.dart';
import 'package:practice_app/widgets/bottomNavBar.dart';
import 'package:practice_app/widgets/myCartWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  static const routeName = '/my-cart';
  MyCart({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    setState(() {
      cart.tryAutoFillCart();
    });
    gotoCheckout() {
      if (cart.items.isEmpty) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Cart is Empty'),
            content:const Text(
              'Want to see products?',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .popAndPushNamed(MyBottomNavigation.routeName);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
      } else {
        Navigator.of(context).pushNamed(Checkout.routeName);
      }
    }

    return Scaffold(
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: primary_icon_two,
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
                backgroundColor: primary_background_two,
                bottom: PreferredSize(
                  child: Container(),
                  preferredSize: Size(0, 20),
                ),
                expandedHeight: MediaQuery.of(context).size.height * 0.2555,
                flexibleSpace: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.only(top: 150),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'My Cart',
                                style: TextStyle(
                                  fontSize: 72,
                                  fontFamily: 'Morganite Bold',
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/pgseven.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: -50,
                      ),
                      Positioned(
                        child: Container(
                          height: 20,
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
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 15,
                            color: primary_text_two,
                            fontFamily: 'SF Pro Display Light',
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'There are'),
                            TextSpan(
                              text: ' ${cart.itemCount}  Product',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: ' in your cart!.')
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    MyCartWidget(
                      cart.items,
                    ),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 200,
                        decoration: BoxDecoration(
                          color: primary_background_five,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  'Sub-Total',
                                  style: TextStyle(
                                    fontFamily: 'PlayFairDisplay',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 120,
                                ),
                                Text(
                                  '\$ ${cart.totalAmount.toInt()}',
                                  style: TextStyle(
                                    fontFamily: 'Morganite Bold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 48,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Container(
                              child: FlatButton(
                                color: primary_text_two,
                                textColor: primary_text_one,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 110, vertical: 20.0),
                                  child: Text(
                                    'Go To Checkout',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'PlayfairDisplay'),
                                  ),
                                ),
                                onPressed: () {
                                  gotoCheckout();
                                },
                              ),
                            ),
                          ],
                        ),
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
