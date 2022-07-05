// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/providers/address_provider.dart';
import 'package:provider/provider.dart';


import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  static const routeName = '/my-account';
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool _selected1 = false, _selected2 = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  String name = "";
  String email = "";
  String payment = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final billingAddress = Provider.of<AddressProvider>(context);
    name = billingAddress.firstData().name;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final billingAddress = Provider.of<AddressProvider>(context);

    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) => Container(
            color: Colors.white,
            height: screenSize.height,
            width: screenSize.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Text(
                        "My Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: primary_background_two,
                            fontSize: 30,
                            fontFamily: 'PlayFairDisplay',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      image: AssetImage("assets/images/pheobe.jpg"),
                      height: 160.0,
                      width: 160.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: primary_background_two,
                          fontSize: 30,
                          fontFamily: 'PlayFairDisplay',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                        child: Center(
                          child: Text(
                            billingAddress.firstData().address,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: primary_background_two,
                              fontSize: 20,
                              fontFamily: 'PlayFairDisplay',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: ListView(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (dialogContext) =>
                                      editNameDialog(dialogContext));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primary_background_six,
                                // border: Border.all(color: Colors.black),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "Full Name",
                                    style: TextStyle(
                                        fontFamily: 'PlayFairDisplay',
                                        fontSize: 15,
                                        color: primary_background_eight),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                    editNameDialog(
                                                        dialogContext));
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
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (dialogContext) =>
                                      editEmailDialog(dialogContext));
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
                                    "Email Address",
                                    style: TextStyle(
                                        fontFamily: 'PlayFairDisplay',
                                        fontSize: 15,
                                        color: primary_background_eight),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        email,
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
                                                    editEmailDialog(
                                                        dialogContext));
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
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (dialogContext) => editPaymentDialog(
                                  dialogContext,
                                ),
                              );
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
                                    "Payment Method",
                                    style: TextStyle(
                                      fontFamily: 'PlayFairDisplay',
                                      fontSize: 15,
                                      color: primary_background_eight,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        payment,
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
                                                  editPaymentDialog(
                                                dialogContext,
                                              ),
                                            );
                                          },
                                          splashColor: Colors.grey,
                                          child: Container(
                                            child: Text(
                                              "Change",
                                              style: TextStyle(
                                                fontFamily: 'PlayFairDisplay',
                                                fontSize: 18,
                                                color: primary_text_two,
                                              ),
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
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget editEmailDialog(context) {
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
              const Text(
                "Change Email",
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 70,
                width: screenSize.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    // autovalidate: true,
                    child: TextFormField(
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Please enter a valid email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black.withOpacity(0.7)),
                      decoration: const InputDecoration(
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
                  child: const Center(
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
      contentPadding: const EdgeInsets.all(0.0),
      content: Container(
        height: 250.0,
        width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Change Name",
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 70,
                width: screenSize.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
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
                  child: const Center(
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

  Widget editPaymentDialog(context) {
    final screenSize = MediaQuery.of(context).size;
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(0.0),
          content: Container(
            height: 250.0,
            width: screenSize.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Change Payment Method",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayFairDisplay',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      width: screenSize.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: _selected1
                                ? primary_background_four
                                : primary_background_five,
                            onPressed: () {
                              setState(() {
                                _selected1 = !_selected1;
                                _selected2 = false;
                              });
                            },
                            child: Image.asset(
                              "assets/images/paypal.png",
                              width: 80,
                              height: 101,
                            ),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          RaisedButton(
                            color: _selected2
                                ? primary_background_four
                                : primary_background_five,
                            onPressed: () {
                              setState(() {
                                _selected1 = false;
                                _selected2 = !_selected2;
                              });
                            },
                            child: Image.asset(
                              "assets/images/visa.png",
                              width: 80,
                              height: 101,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: () {
                      changePaymentMethod(context);
                    },
                    child: Container(
                      height: 45.0,
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Center(
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
      },
    );
  }

  void changeNameMethod(context) async {
    String _name = nameController.text;
    setState(() {
      name = _name;
    });
    Navigator.pop(context);
  }

  void changeEmailMethod(context) async {
    String _email = emailController.text;
    setState(() {
      email = _email;
    });
    Navigator.pop(context);
  }

  void changePaymentMethod(context) async {
    if (_selected1 == true && _selected2 == false) {
      setState(() {
        payment = "Paypal";
      });
    } else {
      setState(() {
        payment = "Visa";
      });
    }
    Navigator.pop(context);
  }
}
