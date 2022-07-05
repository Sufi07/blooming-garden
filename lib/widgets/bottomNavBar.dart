import 'dart:io';

import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/localization/language_constant.dart';
import 'package:practice_app/screens/accounts.dart';

import 'package:practice_app/screens/blog_page.dart';
import 'package:practice_app/screens/camera.dart';

import 'package:practice_app/screens/drawers.dart';
import 'package:practice_app/screens/favorites_products.dart';
import 'package:provider/provider.dart';
import 'package:practice_app/screens/home_page.dart';
import 'package:practice_app/screens/my_cart.dart';
import 'package:practice_app/screens/product_listing.dart';

import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:practice_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyBottomNavigation extends StatefulWidget {
  MyBottomNavigation({Key? key, this.title}) : super(key: key);
  static const routeName = '/navigation-page';
  final String? title;
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int currentIndex = 1;
  final List<Widget> _children = [
    DrawerClass(),
    Homepage(),
    TakePictureScreen(),
    FavoriteScreen(),
    MyAccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.rectangle_split_3x1_fill),
                  // ignore: deprecated_member_use
                  // title: Text(
                  //   getTranslated(context, 'navigator_drawer'),
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //   ),
                  // ),
                  label: getTranslated(context, 'navigator_drawer'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                    color: Colors.black,
                  ),
                  label: getTranslated(context, 'home_navigator'),
                  // ignore: deprecated_member_use
                  // title: Text(
                  //   getTranslated(context, 'home_navigator'),
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //   ),
                  // ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.camera_rotate_fill,
                    color: Colors.black,
                  ),
                  // ignore: deprecated_member_use
                  // title: Text(
                  //   getTranslated(context, 'camera_navigator'),
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //   ),
                  // ),
                  label: getTranslated(context, 'camera_navigator'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.black,
                  ),
                  // ignore: deprecated_member_use
                  // title: Text(
                  //   getTranslated(context, 'favorite_navigator'),
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //   ),
                  // ),
                  label: getTranslated(context, 'favorite_navigator'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  label: getTranslated(context, 'users_navigator'),
                  // ignore: deprecated_member_use
                  // title: Text(
                  //   getTranslated(context, 'users_navigator'),
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //   ),
                  // ),
                ),
              ],
            ),
            tabBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Drawer();
                  break;
                case 1:
                  return Homepage();
                  break;
                case 2:
                  return TakePictureScreen();
                  break;
                case 3:
                  return ProductListing();
                  break;
                case 4:
                  return Blog();
                  break;
                default:
                  return Homepage();
                  break;
              }
            },
          )
        : Scaffold(
            body: _children[currentIndex],
            floatingActionButton: DraggableFab(
              child: FloatingActionButton(
                onPressed: () {
                  // FutureBuilder(
                  //   future: cartData.tryAutoOpen(),
                  //   builder: (context, snapshot) {
                  //     snapshot.connectionState == ConnectionState.waiting
                  //         ? Center(
                  //             child: CircularProgressIndicator(),
                  //           )
                  //         : MyCart();
                  //   },
                  // );
                  Navigator.of(context).pushNamed(MyCart.routeName);
                },
                child: Icon(Icons.shopping_cart),
                backgroundColor: primary_button_color,
              ),
            ),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: currentIndex,
              showElevation: true,
              itemCornerRadius: 8,
              curve: Curves.easeInBack,
              onItemSelected: (index) => setState(() {
                currentIndex = index;
              }),
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.apps),
                  title: Text(
                    getTranslated(context, 'navigator_drawer'),
                  ),
                  activeColor: Colors.black,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: Text(
                    getTranslated(context, 'home_navigator'),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  activeColor: Colors.black,
                  inactiveColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(
                    Icons.camera,
                    color: Colors.black,
                  ),
                  title: Text(
                    getTranslated(context, 'camera_navigator'),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  activeColor: Colors.black,
                  inactiveColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.black,
                  ),
                  title: Text(
                    getTranslated(context, 'favorite_navigator'),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  activeColor: Colors.black,
                  inactiveColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  title: Text(
                    getTranslated(context, 'users_navigator'),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  activeColor: Colors.black,
                  inactiveColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
  }
}
