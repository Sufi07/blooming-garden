import 'package:practice_app/constant/constant_color.dart';

import 'package:practice_app/providers/cart_provider.dart';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UpdateCartScreen extends StatefulWidget {
  static const routeName = '/update-cart';
  UpdateCartScreen({Key? key}) : super(key: key);

  @override
  _UpdateCartScreenState createState() => _UpdateCartScreenState();
}

class _UpdateCartScreenState extends State<UpdateCartScreen> {
  TextEditingController quantityController = TextEditingController();
  String? size;
  bool isSize = false;
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  String? _myQuantitySelection;
  final List<Map> _myJson = [
    {"id": 1, "name": "1"},
    {"id": 2, "name": "2"},
    {"id": 3, "name": "3"},
    {"id": 4, "name": "4"},
  ];

  bool _isLoaded = false;
  var _isInit = true;
  var _updatedCart = CartItem(
    plantId: null,
    id: null,
    title: '',
    price: 0,
    quantity: 0,
    imageAssets: '',
    size: '',
    color: null,
  );
  var _initvalues = {
    'plantid': '',
    'title': '',
    'size': '',
    'color': Null,
    'quantity': 0,
  };

  @override
  void initState() {
    super.initState();
  }

  Color? get colorDecider {
    if (selected1 == true && selected2 == false && selected3 == false) {
      return primary_product_color1;
    } else if (selected1 == false && selected2 == true && selected3 == false) {
      return primary_product_color2;
    } else if (selected1 == false && selected2 == false && selected3 == true) {
      return primary_product_color3;
    } else {
      return null;
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final cartId = ModalRoute.of(context)!.settings.arguments as String;

      if (cartId != null) {
        _updatedCart = Provider.of<Cart>(context).findById(cartId);
        _initvalues = {
          'plantid': _updatedCart.plantId!,
          'title': _updatedCart.title!,
          'size': _updatedCart.size!,
          'color': _updatedCart.color!,
          'quantity': _updatedCart.quantity!,
        };
      }
    }
    _myQuantitySelection = _updatedCart.quantity.toString();
    size = _updatedCart.size;

    if (_updatedCart.color == primary_product_color1) {
      selected1 = !selected1;
      selected2 = false;
      selected3 = false;
    } else if (_updatedCart.color == primary_product_color2) {
      selected1 = false;
      selected2 = !selected2;
      selected3 = false;
    } else if (_updatedCart.color == primary_product_color3) {
      selected1 = false;
      selected2 = false;
      selected3 = !selected3;
    } else {
      selected1 = false;
      selected2 = false;
      selected3 = false;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateCart() {
    var quantity = _myQuantitySelection;

    int quantityy = quantity == '' ? 1 : int.parse(quantity!);
    _updatedCart = CartItem(
      plantId: _updatedCart.plantId,
      id: _updatedCart.id,
      title: _updatedCart.title,
      price: _updatedCart.price,
      quantity: quantityy,
      imageAssets: _updatedCart.imageAssets,
      size: size,
      color: colorDecider,
    );

    if (_updatedCart.id != null) {
      Provider.of<Cart>(context, listen: false)
          .updateCart(_updatedCart.plantId!, _updatedCart);
      setState(() {
        _isLoaded = false;
      });
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Builder(
              builder: (context) {
                return CustomScrollView(
                  shrinkWrap: false,
                  slivers: <Widget>[
                    SliverAppBar(
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: primary_icon_two,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(FontAwesomeIcons.solidQuestionCircle),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                      backgroundColor: primary_background_two,
                      bottom: PreferredSize(
                        child: Container(),
                        preferredSize: Size(0, 20),
                      ),
                      expandedHeight:
                          MediaQuery.of(context).size.height * 0.2555,
                      flexibleSpace: Center(
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                padding: const EdgeInsets.only(top: 150),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Update Cart',
                                      style: TextStyle(
                                        fontSize: 72,
                                        fontFamily: 'Morganite Bold',
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30),
                                  ),
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/pgseven.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              bottom: 0,
                              left: 0,
                              right: 0,
                              top: -50,
                            ),
                            Positioned(
                              child: Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30),
                                  ),
                                ),
                              ),
                              bottom: -1,
                              left: 0,
                              right: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  _initvalues['title'].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'PlayFairDisplay',
                                    fontSize: 48,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Gardening',
                                  style: TextStyle(
                                    fontFamily: 'PlayFairDisplay',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      'Aenean vel leo eget massa sollicitudin placerat non ut est. Donec enim augue, pellentesque et sapien non, vehicula pretium nisi. Mauris scelerisque interdum libero.',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 50,
                                      softWrap: false,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display Light',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              'In Stock',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'PlayFairDisplay',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Text(
                                "Size",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'PlayFairDisplay',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 10,
                            ),
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 10),
                                child: CustomRadioButton(
                                  elevation: 1,
                                  height: 60,
                                  width: 120,
                                  selectedBorderColor: Colors.white,
                                  unSelectedBorderColor: Colors.black,
                                  absoluteZeroSpacing: true,
                                  unSelectedColor: Colors.white,
                                  buttonLables: const [
                                    'S',
                                    'L',
                                    'XL',
                                  ],
                                  buttonValues: const [
                                    "Small",
                                    "Large",
                                    "Extra Large",
                                  ],
                                  buttonTextStyle: const ButtonTextStyle(
                                    selectedColor: Colors.black,
                                    unSelectedColor: Colors.black,
                                    textStyle: TextStyle(fontSize: 16),
                                  ),
                                  radioButtonValue: (value) {
                                    print(value);
                                    size = value as String;
                                  },
                                  defaultSelected: size,
                                  selectedColor: Colors.black26,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Color',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'PlayFairDisplay',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 10,
                                    ),
                                    child: Container(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: selected1 == true ? 70 : 55,
                                            width:
                                                selected1 == true ? 140 : 120,
                                            child: FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  selected1 = !selected1;
                                                  selected2 = false;
                                                  selected3 = false;
                                                });
                                              },
                                              color: primary_product_color1,
                                              padding: EdgeInsets.all(8),
                                              child: Container(),
                                            ),
                                          ),
                                          Container(
                                            height: selected2 == true ? 70 : 55,
                                            width:
                                                selected2 == true ? 140 : 120,
                                            child: FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  selected1 = false;
                                                  selected2 = !selected2;
                                                  selected3 = false;
                                                });
                                              },
                                              color: primary_product_color2,
                                              padding: EdgeInsets.all(8),
                                              child: Container(),
                                            ),
                                          ),
                                          Container(
                                            height: selected3 == true ? 70 : 55,
                                            width:
                                                selected3 == true ? 140 : 120,
                                            child: FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  selected1 = false;
                                                  selected2 = false;
                                                  selected3 = !selected3;
                                                });
                                              },
                                              color: primary_product_color3,
                                              padding: EdgeInsets.all(8),
                                              child: Container(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Quantity',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'PlayFairDisplay',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 370,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          decoration: BoxDecoration(
                                              color: primary_background_one),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                isDense: true,
                                                hint: Text(
                                                  '${_updatedCart.quantity}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                value: _myQuantitySelection,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    _myQuantitySelection =
                                                        newValue;
                                                  });

                                                  print(_myQuantitySelection);
                                                },
                                                items: _myJson.map((Map map) {
                                                  return new DropdownMenuItem<
                                                      String>(
                                                    value: map["id"].toString(),
                                                    child: new Text(
                                                      map["name"],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10, top: 10),
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: primary_button_color_two,
                              ),
                              child: FlatButton(
                                  onPressed: _updateCart,
                                  child: Text(
                                    "Update Cart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: 'PlayFairDisplay'),
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                // ignore: deprecated_member_use
                                Scaffold.of(context).showSnackBar(
                                  new SnackBar(
                                    content: new Text('Save Later.. '),
                                  ),
                                );
                              },
                              child: Text(
                                'or Save Later',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'PlayFairDisplay',
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
