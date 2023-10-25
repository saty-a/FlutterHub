import 'dart:convert';

import 'package:afourthon/constants/utils.dart';
import 'package:afourthon/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../constants/error_handling.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class AuthServices {
  void registerUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
    required String confirmPass,
  }) async {
    try {
      User user = User(
          name: name,
          email: email,
          password: password,
          confirmPass: password,
          id: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/api/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created',
          );
          Navigator.pushReplacement((context),
              CupertinoPageRoute(builder: (context) => const HomePage()));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushReplacement((context),
              CupertinoPageRoute(builder: (context) => const HomePage()));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
