import 'package:flutter/material.dart';

class FilterByColor extends StatefulWidget {
  FilterByColor({Key? key}) : super(key: key);

  @override
  _FilterByColorState createState() => _FilterByColorState();
}

class _FilterByColorState extends State<FilterByColor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Row(
        children: <Widget>[
          FlatButton(
            height: 50,
            minWidth: 100,
            onPressed: () {},
            color: Color.fromRGBO(255, 229, 170, 1),
            padding: EdgeInsets.all(8),
            child: Container(),
          ),
          FlatButton(
            height: 50,
            minWidth: 100,
            onPressed: () {},
            color: Color.fromRGBO(243, 193, 130, 1),
            padding: EdgeInsets.all(8),
            child: Container(),
          ),
          FlatButton(
            height: 50,
            minWidth: 100,
            onPressed: () {},
            color: Color.fromRGBO(184, 181, 190, 1),
            padding: EdgeInsets.all(8),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
