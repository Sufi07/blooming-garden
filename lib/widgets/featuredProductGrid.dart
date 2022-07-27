import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/models/product.dart';
import 'package:practice_app/screens/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeaturedProductGrid extends StatelessWidget {
  const FeaturedProductGrid({
    Key? key,
    required this.featuredProducts,
  }) : super(key: key);

  final List<ProductList> featuredProducts;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(right: 30, left: 10, top: 10),
      physics:
          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: featuredProducts.length,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetail.routeName,
              arguments: {'id': featuredProducts[index].id});
        },
        child: Container(
          //padding: EdgeInsets.only(left:40.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 35.0),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        color: primary_background_six,
                      ),
                    ),
                  ),
                  Container(
                      child: Image.asset(
                    "${featuredProducts[index].imageAsset}",
                    fit: BoxFit.cover,
                  )),
                  Container(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "\$${featuredProducts[index].price.toInt()}",
                  style: TextStyle(fontFamily: 'Morganite Light', fontSize: 50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "${featuredProducts[index].title}",
                  style: TextStyle(fontFamily: 'PlayFairDisplay', fontSize: 18),
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
    );
  }
}
