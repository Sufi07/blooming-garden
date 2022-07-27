import 'package:flutter/material.dart';

class SearchByKeyWord extends StatelessWidget {
  const SearchByKeyWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[10],
      margin: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'SF Pro Display Light',
        ),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              // ignore: deprecated_member_use
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Working on it.",
                  ),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 23,
            ),
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Color.fromRGBO(245, 245, 245, 1),
          hintStyle: TextStyle(color: Colors.black, fontSize: 17),
          hintText: 'Enter your keywords',
          errorStyle: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: 'SF Pro Display Light',
          ),
        ),
      ),
    );
  }
}
