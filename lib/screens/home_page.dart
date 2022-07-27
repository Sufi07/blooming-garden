import 'dart:io';

import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/models/product.dart';
import 'package:practice_app/providers/products_provider.dart';
import 'package:practice_app/screens/notifications.dart';
import 'package:practice_app/widgets/bestSeller.dart';
import 'package:practice_app/widgets/storyWidget.dart';
import 'package:practice_app/widgets/plant_of_month.dart';
import 'package:practice_app/widgets/top_category.dart';
import 'package:practice_app/widgets/type_drop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/home-page';
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double height = 200;

  TextEditingController _searchbyKeyword = TextEditingController();

  List<Widget> _buildLandScapeContent(
    MediaQueryData mediaQuery,
  ) {
    final productData = Provider.of<Products>(context, listen: false);
    productData.fetchData(context);
    final products = productData.items;
    return [
      Container(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            1,
        child: HomePageWidget(
          products: products,
          searchbyKeyword: _searchbyKeyword,
        ),
      ),
    ];
  }

  List<Widget> _buildPortraitContent(
    MediaQueryData mediaQuery,
  ) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return [
      Container(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            1,
        child: HomePageWidget(
          products: products,
          searchbyKeyword: _searchbyKeyword,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final mediaQuery = MediaQuery.of(context);
    final pageBody = SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (isLandscape) ..._buildLandScapeContent(mediaQuery),
              if (!isLandscape) ..._buildPortraitContent(mediaQuery),
            ],
          ),
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            backgroundColor: primary_text_one,
            child: pageBody,
          )
        : Scaffold(
            backgroundColor: primary_text_one,
            body: pageBody,
          );
  }
}

class HomePageWidget extends StatelessWidget {
  HomePageWidget({
    required this.products,
    required this.searchbyKeyword,
  });

  final TextEditingController searchbyKeyword;
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
  final List<ProductList> products;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      //shrinkWrap: true,
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Notifications.routeName);
                },
                child: Icon(
                  Icons.notifications,
                  color: primary_icon_one,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Container(
          child: Text(
            "Blooming Garden",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primary_background_two,
              fontSize: 100.0,
              fontFamily: 'Morganite Bold',
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "MOST PLANTS GROW FROM SEEDS",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primary_background_two,
                fontSize: 18.0,
                fontFamily: 'Morganite-Medium',
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 40.0,
            bottom: 10.0,
          ),
          child: Text(
            'What are you looking for?',
            style: TextStyle(
              color: primary_background_two,
              fontSize: 18,
              fontFamily: 'PlayfairDisplay',
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: Typedropdown(),
        ),
        Card(
          color: primary_background_five,
          margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Platform.isIOS
                ? CupertinoTextField(
                    controller: searchbyKeyword,
                    placeholder: 'Enter your keywords',
                    style: TextStyle(
                      color: primary_text_two,
                      fontSize: 17,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )
                : TextField(
                    style: TextStyle(color: primary_text_two),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search,
                          color: primary_text_two, size: 23.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: primary_background_five,
                      hintStyle: TextStyle(
                        color: primary_text_two,
                        fontSize: 17.0,
                      ),
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
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: SizedBox(
            height: 20.0,
            child: Platform.isIOS
                ? separator.color as Widget
                : Divider(
                    color: primary_background_two,
                  ) as Widget,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            'Our Stories',
            style: TextStyle(
              color: primary_background_two,
              fontSize: 18,
              fontFamily: 'PlayfairDisplay',
            ),
          ),
        ),
        Container(
          child: StoriesWidget(),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            'Plant Of The Month',
            style: TextStyle(
              color: primary_background_two,
              fontSize: 18,
              fontFamily: 'PlayfairDisplay',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Plantofmonth(),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 15.0, bottom: 25.0),
          child: Text(
            'Top Category',
            style: TextStyle(
              color: primary_background_two,
              fontSize: 18,
              fontFamily: 'PlayfairDisplay',
            ),
          ),
        ),
        Container(
          child: Topcategory(),
          margin: EdgeInsets.only(bottom: 25.0),
        ),
        SizedBox(
          height: 10,
        ),
        // Container(
        //   alignment: Alignment.center,
        //   margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
        //   child: Text(
        //     'Best Sellers',
        //     style: TextStyle(
        //       color: primary_background_two,
        //       fontSize: 18,
        //       fontFamily: 'PlayfairDisplay',
        //     ),
        //   ),
        // ),
        // Container(
        //   child: BestSellers(products: products),
        // ),
        // SizedBox(
        //   height: 40,
        // )
      ],
    );
  }
}
