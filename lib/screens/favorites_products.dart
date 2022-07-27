// ignore_for_file: library_private_types_in_public_api

import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/providers/products_provider.dart';
import 'package:practice_app/screens/productDetail.dart';

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  static const routeName = '/favorite-screen';
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: true);
    final products = productData.favoriteItems;
    var parser = EmojiParser();
    var heart = parser.getName('heart');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true, // to center the text in app bar
        title: const Text(
          'Favourites',
          style:  TextStyle(fontFamily: 'PlayFairDisplay', color: Colors.black),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProductDetail.routeName,
                      arguments: {"id": products[index].id});
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 35.0,
                                      ),
                                      child: Container(
                                        height: 165,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: primary_background_six,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        child: Image.asset(
                                      "${products[index].imageAsset}",
                                      fit: BoxFit.cover,
                                    )),
                                    Container(),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Container(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "\$${products[index].price.toInt()}",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: 'Morganite Bold',
                                                fontSize: 48,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "${products[index].title}",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: 'PlayFairDisplay',
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: const Text(
                                              "5 Products left",
                                              style: const TextStyle(
                                                fontFamily:
                                                    'SF Pro Display Light',
                                                fontSize: 16,
                                              ),
                                            ),
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
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 25.0, right: 25.0),
                          child: const Divider(
                            height: 10,
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
