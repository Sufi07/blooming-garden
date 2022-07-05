import 'package:practice_app/constant/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practice_app/providers/address_provider.dart';
import 'package:practice_app/models/billingAddress.dart';

class AddBillingAddress extends StatefulWidget {
  static const routeName = '/addBillingAddress';
  @override
  _AddBillingaddressState createState() => _AddBillingaddressState();
}

class _AddBillingaddressState extends State<AddBillingAddress> {
  int? id;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  var _editedAddress = BillingAddress(
    id: 0,
    name: '',
    address: '',
  );

  var _initValues = {
    'name': '',
    'address': '',
  };

  bool _isInit = true;
  bool _isLoaded = false;

  String name = "";
  String address = "";
  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as int;
    id = routeArgs;
    if (id != 0) {
      final billingAddress = Provider.of<AddressProvider>(context);
      final billingData = billingAddress.findByIdB(id!);
      name = billingData.name;
      address = billingData.address;
      _initValues = {
        'name': billingData.name,
        'address': billingData.address,
      };
    }
    final billingAddress = Provider.of<AddressProvider>(context);
    final billingData = billingAddress.findByIdB(id!);
    name = billingData.name;
    address = billingData.address;
    super.didChangeDependencies();
  }

  void _saveForm() {
    if (_editedAddress.id >= 0) {
      Provider.of<AddressProvider>(context, listen: false)
          .updateBillingAddress(_editedAddress.id, _editedAddress);
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final billingAddress = Provider.of<AddressProvider>(context);
    final billingData = billingAddress.findByIdB(id!);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true, // to center the text in app bar
        title: const Text(
          'Billing Address',
          style: TextStyle(fontFamily: 'PlayFairDisplay', color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black, // add custom icons also
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Here you can edit your Billing Address.',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'SF Pro Display Light',
                        color: primary_text_two,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (dialogContext) => editNameDialog(dialogContext));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primary_background_six,
                  // border: Border.all(color: Colors.black),
                ),
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Full Name",
                      style: TextStyle(
                          fontFamily: 'PlayFairDisplay',
                          fontSize: 15,
                          color: primary_background_eight),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              fontFamily: 'PlayFairDisplay',
                              fontSize: 18,
                              color: primary_text_two),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (dialogContext) =>
                                      editNameDialog(dialogContext));
                            },
                            splashColor: Colors.grey,
                            child: Container(
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontFamily: 'PlayFairDisplay',
                                    fontSize: 18,
                                    color: primary_text_two),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (dialogContext) =>
                        editAddressDialog(dialogContext));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primary_background_six,
                  // border: Border.all(color: Colors.black),
                ),
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Enter new Address",
                      style: TextStyle(
                          fontFamily: 'PlayFairDisplay',
                          fontSize: 15,
                          color: primary_background_eight),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          address,
                          style: TextStyle(
                              fontFamily: 'PlayFairDisplay',
                              fontSize: 18,
                              color: primary_text_two),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (dialogContext) =>
                                      editAddressDialog(dialogContext));
                            },
                            splashColor: Colors.grey,
                            child: Container(
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontFamily: 'PlayFairDisplay',
                                    fontSize: 18,
                                    color: primary_text_two),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 70,
                width: 500,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  color: primary_background_two,
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: primary_text_one,
                        fontSize: 20.0,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    print('doing');
                    _saveForm();
                    print('done');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget editAddressDialog(context) {
    final screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0.0),
      content: Container(
        height: 250.0,
        width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Change Address",
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 70,
                width: screenSize.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    // autovalidate: true,
                    child: TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black.withOpacity(0.7)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter New Email",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 14.0),
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  changeEmailMethod(context);
                },
                child: Container(
                  height: 45.0,
                  width: screenSize.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontFamily: 'PlayFairDisplay',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget editNameDialog(context) {
    final screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0.0),
      content: Container(
        height: 250.0,
        width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Change Name",
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 70,
                width: screenSize.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter New Name",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                      filled: true,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  changeNameMethod(context);
                },
                child: Container(
                  height: 45.0,
                  width: screenSize.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontFamily: 'PlayFairDisplay',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeNameMethod(context) async {
    String _name = nameController.text;
    setState(() {
      name = _name;
      _editedAddress = BillingAddress(
        id: _editedAddress.id,
        name: name,
        address: _editedAddress.address,
      );
    });
    Navigator.pop(context);
  }

  void changeEmailMethod(context) async {
    String _address = addressController.text;
    setState(() {
      address = _address;
      _editedAddress = BillingAddress(
        id: _editedAddress.id,
        name: _editedAddress.name,
        address: address,
      );
    });
    Navigator.pop(context);
  }
}
