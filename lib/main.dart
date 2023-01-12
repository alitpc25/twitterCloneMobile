import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/globals.dart';
import 'package:flutter_twitter_clone/pages/login.dart';
import 'package:flutter_twitter_clone/pages/register.dart';

void main() {
  PreferenceUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Twitter Clone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const Login(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/register': (context) => const Register(),
        });
  }
}
