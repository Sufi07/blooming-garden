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
    return null;
  }

  Future<void> signup(String userName, String email, String phoneNumber,
      String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCOmIDbjUJhih0cEPk51x_KnntmDMQwpJI';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'userName': userName,
            'email': email,
            'phoneNumber': phoneNumber,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      _autoLogout(); //because this is officially where the user will be login
      notifyListeners();
      final prefs = await SharedPreferences
          .getInstance(); // it will work as the tunnel to the device storage
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
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
    const url = 'http://192.168.50.106:5000/login';
    http.Response responses = await http.get(Uri.parse(url));

    try {
      print("hello there im in loginapi call");
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            "email": email,
            "password": password,
            //"returnSecureToken": true,
          },
        ),
      );

      print("Status of API: ");
      print(response.statusCode);
      final responseData = json.decode(response.body);
      print("in login api call from google apis");
      print(responseData.toString());
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      print(responseData['expiresIn']);
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences
          .getInstance(); // it will work as the tunnel to the device storage
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
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
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timetoExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timetoExpiry), logout);
  }
}
