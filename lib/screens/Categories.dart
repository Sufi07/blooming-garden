import 'package:flutter/material.dart';
import 'package:practice_app/providers/products_provider.dart';
import 'package:practice_app/widgets/indoorPalm.dart';
import 'package:practice_app/widgets/indoorSecculentPlants.dart';
import 'package:practice_app/widgets/top_category.dart';
import 'package:practice_app/widgets/trailingPlant.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  static const routeName = '/categories-screen';
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final plants = Provider.of<Products>(context).items.toString();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true, // to center the text in app bar
        title: const Text(
          'Categories',
          style: TextStyle(fontFamily: 'PlayFairDisplay', color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black, // add custom icons also
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(child: Topcategory()),
          ),
          Container(
            child: Trailingplants(),
          ),
          Container(
            child: IndoorSucculentplants(),
          ),
          Container(
            child: Indoorpalm(),
          ),
        ],
      ),
    );
  }
}
