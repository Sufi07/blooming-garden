// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/providers/products_provider.dart';
import 'package:practice_app/widgets/featuredProductGrid.dart';
import 'package:practice_app/widgets/newProductGrid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/api.dart';

class ProductListing extends StatefulWidget {
  static const routeName = '/product-listing';

  @override
  _ProductListingState createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing>
    with SingleTickerProviderStateMixin {
  String? category;
  String? quantity;

  Future<List<ProductList>> k() async {
    List<ProductList> prodlist = [];
    final response = await http.get(
        Uri.parse("https://mocki.io/v1/6c5a30ee-c483-478d-878b-49a1e6390044"));
    //final data = json.decode(response.body);
    final jsonResponse = json.decode(response.body);
    for (var prod in jsonResponse) {
      prodlist.add(ProductList.fromJson(prod));
    }
    print("Hello dataK()");
    print(prodlist.length);
    return prodlist;
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    category = routeArgs['category'];
    quantity = routeArgs['quantity'];
    super.didChangeDependencies();
  }

  TabController? _controller;
  int _selectedIndex = 2;
  double _containerheight = 100;

  double _totalarrayheight(double total_number) {
    if ((total_number % 2) == 0) {
      return total_number; // number is even
    }
    return total_number + 1;
  }

  List<Widget> list = [
    Tab(text: "New"),
    Tab(text: "Featured"),
  ];
  Future<void> gettingData() async {
    print("start of getting data");
    List<ProductList> response = await getData();
    print("in getting data");
    print("Response");
    print(response);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //k();
    gettingData();
    final productData = Provider.of<Products>(context, listen: false);
    productData.fetchData(context);
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);
    _containerheight = _totalarrayheight(8) * 140;
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    final featuredProducts = productData.featuredItems;

    _controller!.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
        if (_controller!.index == 0) {
          _containerheight =
              140 * _totalarrayheight(products.length.toDouble());
        } else {
          _containerheight =
              140 * _totalarrayheight(featuredProducts.length.toDouble());
        }
      });
      if (kDebugMode) {
        print("Selected Index: " + _controller!.index.toString());
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  leading: new IconButton(
                    icon: new Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                  // bottom: PreferredSize(
                  //   preferredSize:const Size.fromHeight(100.0),
                  //   child: Container(),
                  // ),
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
                          // ignore: sort_child_properties_last
                          child: Center(
                            child: Container(
                              child: Text(
                                category!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Morganite Bold',
                                    fontSize: 75),
                              ),
                            ),
                          ),
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0),
                      Positioned(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50),
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
                    [
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RichText(
                                text: TextSpan(
                                  text: 'There are ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'SF Pro Display Light',
                                    color: primary_text_two,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '$quantity products ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'SF Pro Display Light',
                                        color: primary_text_two,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'in this category.',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'SF Pro Display Light',
                                        color: primary_text_two,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DefaultTabController(
                                length: 2,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: TabBar(
                                          indicatorColor: Colors.black,
                                          labelColor: Colors.black,
                                          unselectedLabelColor: Colors.grey,
                                          indicatorWeight: 5,
                                          labelStyle: TextStyle(
                                              fontFamily: 'PlayfairDisplay',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                          onTap: (index) {
                                            print(index);
                                          },
                                          controller: _controller,
                                          tabs: list),
                                    ),
                                    Container(
                                      height: _containerheight,
                                      child: TabBarView(
                                        controller: _controller,
                                        children: <Widget>[
                                          Container(
                                            //height: 140.0 * _totalarrayheight(tagObjs.length.toDouble()),
                                            child: NewProductGrid(
                                                products: products),
                                          ),
                                          Container(
                                            //height: 140.0 * _totalarrayheight(tagObjs1.length.toDouble()),
                                            child: FeaturedProductGrid(
                                              featuredProducts:
                                                  featuredProducts,
                                            ),
                                          ),
                                        ],
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
