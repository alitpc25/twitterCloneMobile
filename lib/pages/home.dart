import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/components/bottom_navbar.dart';
import 'package:flutter_twitter_clone/components/drawer.dart';
import 'package:flutter_twitter_clone/components/header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: Header(scaffoldKey: scaffoldKey),
        body: const Center(child: Text('Welcome')),
        drawer: const MyDrawer(),
        bottomNavigationBar: const BottomNavBar());
  }
}
