import 'package:practice_app/models/payments_model.dart';

import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    Key? key,
    required this.payment,
  }) : super(key: key);
  final Payments payment;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: payment.isSelected
          ? Color.fromRGBO(245, 245, 245, 8)
          : Color.fromRGBO(245, 245, 245, 1),
      child: Container(
        height: 80,
        width: 80,
        alignment: Alignment.center,
        margin: new EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("${payment.img}"),
            ),
            // Icon(
            //   payment.img,
            //   color: payment.isSelected ? Colors.white : Colors.grey,
            //   size: 40,
            // ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
