import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  String? _name;
  String? _email;
  Timer? _authTimer;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token!;
    }
    return "";
  }

  Future<void> signup(String userName, String email, String phoneNumber,
      String password) async {
    const url = 'http://192.168.50.107:45455/V1/json/data/register-user';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            {
              "param1": {
                "JSON": {
                  "FullName": userName,
                  "EmailAddress": email,
                  "Password:": password,
                  "PhoneNo": phoneNumber,
                  "IsTermOfUseAccepted": "true",
                  "IsPrivacyPolicyAccepted": "true",
                  "BillingAddress": "stadiumrd",
                  "ShippingAddress": "stadiumrd"
                }
              }
            }
          },
        ),
      );

      final responseData = json.decode(response.body);
      print(responseData.toString());
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['Token'];
      _userId = responseData['Data']['UserID'];
      _email = responseData['Data']['EmailAddress'];
      _name = responseData['Data']['FullName'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: 36000,
        ),
      );
      _autoLogout(); //because this is officially where the user will be login
      notifyListeners();
      final prefs = await SharedPreferences
          .getInstance(); // it will work as the tunnel to the device storage
      final userData = json.encode(
        {
          'token': _token,
          //'userId': _userId,
          'email': _email,
          'name': _name,
          'expriryDate': _expiryDate!.toIso8601String(),
        },
      );
      prefs.setString(
        'userData',
        userData,
      ); //'userdata' can be named anything. up to us.
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    const url = 'http://192.168.50.107:45455/V1/json/data/login';
    //http.Response responses = await http.post(Uri.parse(url));
    print("Email: " + email);
    print("Password: " + password);
    try {
      print("hello there im in loginapi call");
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode(
          {
            "param": {
              "Email": email.toString(),
              "Password": password.toString()
              //"returnSecureToken": true,
            }
          },
        ),
      );

      print("Status of API: ");
      print(response.statusCode);
      final responseData = json.decode(response.body);
      print("in login api call ");
      print(responseData.toString());
      if (responseData['ErrorMessage'] != null) {
        throw HttpException(responseData['ErrorMessage']);
      }
      print(responseData['Data']['UserID']);
      _token = responseData['Token'];
      _userId = responseData['Data']['UserID'].toString();
      _email = responseData['Data']['EmailAddress'];
      _name = responseData['Data']['FullName'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: 36000,
        ),
      );
      //AliAhmed@gmail.com
      //print(responseData['expiresIn']);
      //_autoLogout();
      print("notifying listener");
      notifyListeners();
      print("notified listener");
      final prefs = await SharedPreferences
          .getInstance(); // it will work as the tunnel to the device storage
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'email': _email,
          'name': _name,
          'expriryDate': _expiryDate!.toIso8601String(),
        },
      );
      prefs.setString(
        'userData',
        userData,
      );
      print("printing user data");
      print(userData); //'userdata' can be named anything. up to us.
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, Object>;
    final expiryDate =
        DateTime.parse(extractedUserData['expriryDate'].toString());

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'] as String;
    _userId = extractedUserData['userId'] as String;
    _expiryDate = expiryDate;

    notifyListeners();
    _autoLogout();
    return true;
  }

  void logout() async {
    _token = "";
    _userId = "";
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
    notifyListeners();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timetoExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timetoExpiry), logout);
  }
}
