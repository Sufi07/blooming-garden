// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice_app/dummy_data.dart';
import 'package:practice_app/models/plantGuide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:practice_app/screens/plantGuideDetails.dart';

import '../models/storiesData.dart';

Future<PlantGuide> fetchData() async {
  final response = await http.get(
      Uri.parse("https://mocki.io/v1/944b1b54-d45e-4709-8178-081a2220f932"));
  if (response.statusCode == 200) {
    return PlantGuide.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class PlantGuideScreen extends StatefulWidget {
  static const routeName = '/plant-guide-screen';

  @override
  State<PlantGuideScreen> createState() => _PlantGuideScreenState();
}

class _PlantGuideScreenState extends State<PlantGuideScreen> {
  late List<PlantGuide> items = [];
  // = DummyPlantGuide.map(
  //   (e) => PlantGuide(
  //     id: e.id,
  //     title: e.title,
  //     imageAsset: e.imageAsset,
  //   ),
  // ).toList();
  @override
  void initState() {
    fetchData(); //as List<PlantGuide>;
    print("Wokring or not");
    print(items);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var json1 = {
    //   "PlantGuide": {
    //     "id": 1,
    //     "title": "Response Parsed",
    //     "imageAsset": "assets/images/pgone.jpg"
    //   }
    // };
    // var mapResponse = json.decode(json1);
    // print(mapResponse.toList());
    // var jsonParsed = [
    //   PlantGuide(
    //     id: '1',
    //     title: 'Stories passsed',
    //     imageAsset: 'assets/images/pgone.jpg',
    //   )
    // ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true, // to center the text in app bar
        title: Text(
          'Plants & Guides',
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) => Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Plantguidedetails.routeName, arguments: {
                  'title': items[index].title,
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(items[index].imageAsset),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    items[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontFamily: 'Morganite Bold',
                        letterSpacing: 1.5),
                  ),
                ),
              ),
            ),
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 3 : 2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}
