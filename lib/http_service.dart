import 'dart:ffi';
import 'dart:io';
import 'package:flutter_twitter_clone/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HttpService {
  final String backendURL = "192.168.2.146:3000";

  Future<Void?> createUser(
      Map<String, dynamic> map, BuildContext context) async {
    var uri = Uri.http(backendURL, 'auth/register');
    Response response = await post(uri, body: map);
    if (response.statusCode == HttpStatus.badRequest) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.body),
        duration: const Duration(seconds: 4),
      ));
    } else if (response.statusCode == HttpStatus.created) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return Home();
      }));
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", map["email"]);
    pref.setString("username", map["username"]);
    return null;
  }

  Future<Void?> loginUser(
      Map<String, dynamic> map, BuildContext context) async {
    var uri = Uri.http(backendURL, 'auth/login');
    Response response = await post(uri, body: map);
    if (response.statusCode == HttpStatus.badRequest) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.body),
        duration: const Duration(seconds: 4),
      ));
    } else if (response.statusCode == HttpStatus.ok) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return Home();
      }));
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", map["email"]);
    pref.setString("username", map["username"]);
    return null;
  }
}
