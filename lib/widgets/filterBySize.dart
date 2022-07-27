import 'package:custom_radio_button/custom_radio_button.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

class FilterBySize extends StatefulWidget {
  const FilterBySize({
    Key? key,
  }) : super(key: key);

  @override
  _FilterBySizeState createState() => _FilterBySizeState();
}

class _FilterBySizeState extends State<FilterBySize> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10),
      child: CustomRadioButton(
          elevation: 1,
          height: 60,
          selectedBorderColor: Colors.white,
          unSelectedBorderColor: Colors.black,
          absoluteZeroSpacing: true,
          unSelectedColor: Colors.white,
          buttonLables: [
            'S',
            'L',
            'XL',
          ],
          buttonValues: [
            "Small",
            "Large",
            "Extra Large",
          ],
          buttonTextStyle: ButtonTextStyle(
              selectedColor: Colors.black,
              unSelectedColor: Colors.black,
              textStyle: TextStyle(fontSize: 16)),
          radioButtonValue: (value) {
            print(value);
          },
          selectedColor: Colors.black26),
    );
  }
}
