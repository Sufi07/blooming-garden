// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/null-safe packages/range_slider/flutter_range_slider.dart'
    as frs;

class Filterbyrange extends StatefulWidget {
  const Filterbyrange({Key? key}) : super(key: key);

  @override
  _FilterbyrangeState createState() => _FilterbyrangeState();
}

class _FilterbyrangeState extends State<Filterbyrange> {
  double minPrice = 0;
  double maxPrice = 499;
  double _lowerValue = 0;
  double _upperValue = 499;

  // double get minSliderValue {
  //   setState(() {
  //     minPrice = _lowerValue;
  //   });
  //   return minPrice;
  // }

  // double get maxSliderValue {
  //   setState(() {
  //     minPrice = _upperValue;
  //   });
  //   return maxPrice;
  // }

  // @override
  // void initState() {
  //   minSliderValue;
  //   maxSliderValue;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        frs.RangeSlider(
          min: minPrice,
          max: maxPrice,
          lowerValue: _lowerValue,
          upperValue: _upperValue,
          divisions: 45,
          allowThumbOverlap: true,
          showValueIndicator: true,
          valueIndicatorMaxDecimals: 0,
          onChanged: (double newLowerValue, double newUpperValue) {
            setState(() {
              _lowerValue = newLowerValue;
              _upperValue = newUpperValue;
            });
          },
          onChangeStart: (double startLowerValue, double startUpperValue) {
            if (kDebugMode) {
              print(
                  'Started with values: $startLowerValue and $startUpperValue');
            }
          },
          onChangeEnd: (double newLowerValue, double newUpperValue) {
            if (kDebugMode) {
              print('Ended with values: $newLowerValue and $newUpperValue');
            }
          },
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '\$${_lowerValue.toInt()}',
                style: const TextStyle(
                    fontFamily: 'SF Pro Display Light',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${_upperValue.toInt()}',
                style: const TextStyle(
                    fontFamily: 'SF Pro Display Light',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
