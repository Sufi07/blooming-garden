import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _value = '';
  // ignore: deprecated_member_use
  List<String>? _values;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      color: Color.fromRGBO(254, 238, 213, 1),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(1),
          // ignore: unnecessary_new
          child: new Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    child: const Text(
                      'Type',
                      style: TextStyle(
                        fontFamily: 'SF pro Display Light',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isDense: true,
                      hint: const Text(
                        'Select Plant Type',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      value: _value,
                      onChanged: (val) {
                        _onChanged(val!);
                      },
                      items: _values!.map((e) {
                        return new DropdownMenuItem(
                          value: e,
                          child: Row(
                            children: <Widget>[
                              Container(
                                  child: Text(
                                '$e',
                                style: TextStyle(
                                  fontFamily: 'SF pro Display Light',
                                  fontSize: 16,
                                ),
                              ))
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
