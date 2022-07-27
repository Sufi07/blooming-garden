// ignore_for_file: deprecated_member_use, sort_child_properties_last

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/localization/language_constant.dart';
import 'package:practice_app/screens/forgotPassword.dart';
import 'package:practice_app/widgets/bottomNavBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/auth.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  static const routeName = '/auth-screen';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with WidgetsBindingObserver {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'phoneNumber': '',
    'username': '',
  };

  late SharedPreferences preferences;
  int id = 0;
  String email = "";
  String userID = "";
  Future<void> getSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
    userID = await preferences.getString('userData') ?? 'data not found';
    final data = jsonDecode(userID);
    //final id = int.parse(data["userId"]);

    setState(() {
      id = int.parse(data["userId"]);
      email = data['email'];
    });
  }

  var _isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _obscureText = true;
  bool login = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('An Error Occured!'),
        content: Text(message),
        actions: [
          FlatButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    getSharedPreferences();
    if (!_formKey.currentState!.validate()) {
      // Invalid!

      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email']!,
          _authData['password']!,
        );
      } else {
        await Provider.of<Auth>(context, listen: false).signup(
          _authData['username']!,
          _authData['email']!,
          _authData['phoneNumber']!,
          _authData['password']!,
        );
      }
      print("Inside Submit Function: ");
      print(_authData['email']);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication Error';
      if (error.toString().contains('EMAIL_EXITS')) {
        errorMessage = 'This Email Address exist';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is Not a Valid Email Address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This Password Is too Weak';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not Find a User With That Email';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid Message';
      } else if (error.toString().contains('USERNAME_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email';
      }

      _showErrorDialog(errorMessage);
    } catch (error) {
      print("Http error here HBFSGajhsgFJHGSFJHGSFAJHFG!!!!!!!!!!!!!!");
      print(error);
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }
    setState(
      () {
        _isLoading = false;
      },
    );
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _formKey.currentState!.reset();

        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _formKey.currentState!.reset();

        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: primary_background_two,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      alignment: Alignment.center,
                      child: Text(
                        _authMode == AuthMode.Login
                            ? getTranslated(context, 'login-page-title')
                            : getTranslated(context, 'signup_page_title'),
                        style: const TextStyle(
                          color: primary_text_one,
                          fontFamily: 'Morganite Bold',
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                          fontSize: 80,
                        ),
                      ),
                    ),
                    Container(
                      width: 400.0,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        getTranslated(context, 'login-page-description'),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: primary_text_one,
                          fontFamily: 'SF Pro Display Light',
                          fontSize: 15,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            if (_authMode == AuthMode.Signup)
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return getTranslated(
                                          context, 'userName_error');
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.email,
                                      size: 25.0,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: primary_background_four,
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primary_text_one,
                                        width: 0.0,
                                      ),
                                    ),
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    labelText: getTranslated(
                                        context, 'userName_placeholer'),
                                    errorStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onSaved: (value) {
                                    _authData['username'] = value!;
                                    print('getting value from form');
                                  },
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                style: const TextStyle(
                                  color: primary_text_one,
                                ),
                                controller: nameController,
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return getTranslated(
                                        context, 'email_error');
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    FontAwesomeIcons.user,
                                    color: primary_icon_two,
                                    size: 25,
                                  ),
                                  filled: true,
                                  fillColor: primary_background_four,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: primary_background_one,
                                      width: 0.0,
                                    ),
                                  ),
                                  labelStyle:
                                      const TextStyle(color: primary_text_one),
                                  labelText: getTranslated(
                                      context, 'email_placeholderB'),
                                  errorStyle: const TextStyle(
                                    color: primary_text_one,
                                  ),
                                ),
                                onSaved: (value) {
                                  _authData['email'] = value!;
                                },
                              ),
                            ),
                            if (_authMode == AuthMode.Signup)
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  // ignore: missing_return
                                  validator: (val) {
                                    if (val == "") {
                                      return getTranslated(
                                          context, 'phone_number_error');
                                    }
                                  },
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.phone,
                                      size: 25.0,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFF363636),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0.0,
                                      ),
                                    ),
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    labelText: getTranslated(
                                        context, 'phoneNumber_placeholder'),
                                    errorStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onSaved: (val) {
                                    _authData['phoneNumber'] = val!;
                                  },
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                style: const TextStyle(
                                  color: primary_text_one,
                                ),
                                obscureText: _obscureText,
                                controller: passwordController,
                                // ignore: missing_return
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 5) {
                                    return getTranslated(
                                        context, 'password_error');
                                  }
                                },
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: _toggle,
                                    child: Icon(
                                      _obscureText
                                          ? FontAwesomeIcons.eye
                                          : FontAwesomeIcons.eyeSlash,
                                      size: 25.0,
                                      color: primary_icon_two,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: primary_background_four,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.0,
                                    ),
                                  ),
                                  labelStyle:
                                      const TextStyle(color: primary_text_one),
                                  labelText: getTranslated(
                                      context, 'password_placeholder'),
                                  errorStyle: const TextStyle(
                                    color: primary_text_one,
                                  ),
                                ),
                                onSaved: (value) {
                                  _authData['password'] = value!;
                                },
                              ),
                            ),
                            if (_authMode == AuthMode.Login)
                              Container(
                                alignment: Alignment.topRight,
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(Forgetpass.routeName);
                                  },
                                  textColor: primary_text_one,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      getTranslated(context, 'forgot_password'),
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'SF Pro Display Light',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (_authMode == AuthMode.Login)
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 5.0, left: 10, right: 10),
                                child: Container(
                                  height: 55,
                                  child: Container(
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // wrap height
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        // stretch across width of screen
                                        children: <Widget>[
                                          _buildFacebookLoginButton(),
                                          _buildGoogleLoginButton(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    _authMode == AuthMode.Login
                                        ? getTranslated(
                                            context, 'doesnt_have_an_account')
                                        : getTranslated(
                                            context, 'already_have_an_account'),
                                    style: const TextStyle(
                                        color: primary_icon_two,
                                        fontSize: 15,
                                        fontFamily: 'SF Pro Display Light'),
                                  ),
                                  FlatButton(
                                    textColor: primary_text_one,
                                    child: Text(
                                      _authMode == AuthMode.Login
                                          ? getTranslated(
                                              context, 'register_now_button')
                                          : getTranslated(
                                              context, 'login_now_button'),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: _switchAuthMode,
                                  ),
                                ],
                              ),
                            ),
                            if (_isLoading)
                              const CircularProgressIndicator()
                            else
                              Container(
                                height: 55,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                margin: _authMode == AuthMode.Signup
                                    ? const EdgeInsets.only(top: 20)
                                    : const EdgeInsets.only(top: 0),
                                child: RaisedButton(
                                  color: primary_background_one,
                                  child: Text(
                                    _authMode == AuthMode.Login
                                        ? getTranslated(context, 'login_button')
                                        : getTranslated(
                                            context, 'signup_button'),
                                    style: const TextStyle(
                                      color: primary_background_two,
                                      fontSize: 20.0,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_authMode == AuthMode.Login) {
                                      _submit();
                                      if (id != 0) {
                                        Navigator.of(context).pushNamed(
                                            MyBottomNavigation.routeName);
                                      }

                                      //print(_submit().toString());
                                    }

                                    if (_authMode == AuthMode.Signup) {
                                      _submit();
                                    }
                                    if (login == true) {
                                      Navigator.of(context).popAndPushNamed(
                                          AuthScreen.routeName);
                                    }
                                    ;
                                  },
                                ),
                              ),

                            // if (_authMode == AuthMode.Login)
                            //   Container(
                            //     child: Icon(
                            //       Icons.fingerprint,
                            //       color: primary_icon_two,
                            //       size: 50,
                            //     ),
                            //   ),
                            // SizedBox(
                            //   height: 50,
                            // ),
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
      ),
    );
  }

  Container _buildGoogleLoginButton() {
    return Container(
      child: ButtonTheme(
        child: RaisedButton(
          onPressed: () {},
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textColor: const Color.fromRGBO(122, 122, 122, 1),
          child: Container(
            width: 130,
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.google),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: const Text(
                    "Google",
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display Light',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildFacebookLoginButton() {
    return Container(
      child: ButtonTheme(
        child: RaisedButton(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          onPressed: () {},
          color: const Color.fromRGBO(27, 76, 213, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textColor: Colors.white,
          child: Container(
            width: 130,
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.facebookF),
                const Padding(
                  padding: EdgeInsets.all(
                    8.0,
                  ),
                  child: Text(
                    "Facebook",
                    style: TextStyle(
                      fontFamily: 'SF Pro Display Light',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
