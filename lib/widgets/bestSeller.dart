import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/models/product.dart';

import 'package:practice_app/screens/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<ProductList> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.only(right: 30, left: 10, top: 10),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 4,
        itemCount: products.length - 3,
        itemBuilder: (BuildContext context, int index) => Container(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetail.routeName,
                arguments: {
                  'title': products[index].title,
                  'price': products[index].price,
                  'imageAsset': products[index].imageAsset,
                  'id': products[index].id,
                },
              );
            },
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Container(
                        height: 165,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primary_background_six,
                        ),
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        "${products[index].imageAsset}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "\$${products[index].price.toInt()}",
                    style: TextStyle(
                      fontFamily: 'Morganite Light',
                      fontSize: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Text(
                    "${products[index].title}",
                    style: TextStyle(
                      fontFamily: 'PlayFairDisplay',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 3 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
