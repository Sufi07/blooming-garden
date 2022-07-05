import 'dart:io';

import 'package:practice_app/constant/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> vals = <String>[
  'Trailing And Plants',
  'Flowering Plants',
  'Indoor Palms',
  'Seculant Plants',
];

class Typedropdown extends StatefulWidget {
  @override
  _TypedropdownState createState() => _TypedropdownState();
}

class _TypedropdownState extends State<Typedropdown> {
  String? _value = '';

  int _selectedIndex = 0;
  // ignore: deprecated_member_use
  List<String>? _values = [];
  // ignore: must_call_super
  void initState() {
    _values!.addAll([
      'Trailing And Plants',
      'Flowering Plants',
      'Indoor Palms',
      'Seculant Plants',
    ]);
    _value = null;
  }

  void _onChanged(String val) {
    setState(() {
      _value = val;
      print('I am in typedropdown');
      print(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Row(
            children: <Widget>[
              CupertinoButton(
                child: Text("Select Plant"),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200.0,
                        child: CupertinoPicker(
                          itemExtent: 32.0,
                          onSelectedItemChanged: (int index) {
                            setState(
                              () {
                                print('index of category');
                                print(index);
                                _selectedIndex = index;
                              },
                            );
                          },
                          children: new List<Widget>.generate(
                            vals.length,
                            (int index) {
                              return new Center(
                                child: new Text(vals[index]),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Text(
                vals[_selectedIndex],
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          )
        : Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            color: primary_background_one,
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isDense: true,
                    hint: const Text(
                      "Select plant type",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    value: _value,
                    onChanged: (val) {
                      _onChanged(val!);
                      print('val in changed');
                      print(val);
                    },
                    items: _values!.map((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(
                          '$e',
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          );
  }
}
