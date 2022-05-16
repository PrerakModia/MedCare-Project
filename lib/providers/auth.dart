import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../http_exception.dart';
import 'dart:async';

class Auth with ChangeNotifier {
  String _token = '';
  DateTime? _expiryDate;
  String _userID = '';

  bool get isAuth {
    // print('isAuth Accessed');
    // print(_token != '');
    return _token != '';
  }

  String get token {
    print('Get Token is accessed');
    return _token;
  }

  String get userID {
    print('User ID is accessed');
    return _userID;
  }

  Future<void> _authenticate(
      String email, String password, String usertype) async {
    print('sign up accessed');
    try {
      final url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA8pbUa5w95APGlWDUNzq29FupKrlFHxFI');
      http.Response response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      final responseData = json.decode(response.body);
      _token = responseData['idToken'];
      _userID = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      notifyListeners();
      //print(responseData);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> _authenticate_login(String email, String password) async {
    try {
      final url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA8pbUa5w95APGlWDUNzq29FupKrlFHxFI');
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      final responseData = json.decode(response.body);
      print('Local ID: ${responseData['usertype']}');
      _token = responseData['idToken'];
      _userID = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      //print()
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signup(String email, String password, String usertype) async {
    //print('11111');
    return _authenticate(email, password, usertype);
  }

  Future<void> login(String email, String password) async {
    return _authenticate_login(email, password);
  }

  // Future<bool> tryAutoLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (!prefs.containsKey('userData')) return false;
  //   final extractedUserData = json
  //       .decode(prefs.getString('userData').toString()) as Map<String, Object>;
  //   final expiryDate =
  //       DateTime.parse(extractedUserData['expiryDate'] as String);
  //   if (expiryDate.isBefore(DateTime.now())) return false;
  //   _token = extractedUserData['token'] as String;
  //   _userID = extractedUserData['userID'] as String;
  //   _expiryDate = expiryDate;
  //   notifyListeners();
  //   _autologout();
  //   return true;
  // }

  // void logout() {
  //   _token = '';
  //   _userID = '';
  //   _expiryDate = DateTime(2018, 1, 13);
  //   notifyListeners();
  // }

  // void _autologout() {
  //   final time_to_expiry = _expiryDate!.difference(DateTime.now()).inSeconds;
  //   Timer(Duration(seconds: time_to_expiry), logout);
  // }
}
