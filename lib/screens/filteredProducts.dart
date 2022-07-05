import 'package:practice_app/constant/constant_color.dart';
import 'package:flutter/material.dart';

class FilterProducts extends StatelessWidget {
  static const routeName = '/filter-product';
  const FilterProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_background_seven,
      appBar:  AppBar(
        backgroundColor: primary_background_seven,
        title: const Text(
          'Filtered Product',
          style: TextStyle(
            fontFamily: 'PlayFairDisplay',
            color: primary_text_two,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child:const  Icon(
            Icons.arrow_back,
            color: primary_icon_one,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Working on it...',
            style: TextStyle(
              fontFamily: 'PlayFairDisplay',
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
