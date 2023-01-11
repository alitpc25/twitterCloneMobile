import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      appBar: AppBar(
        leading: MenuIcon(scaffoldKey: scaffoldKey),
        centerTitle: true,
        title: const Icon(FontAwesomeIcons.twitter),
      ),
      body: const Center(child: Text('Welcome')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MenuIcon extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  MenuIcon({super.key, required this.scaffoldKey});

  @override
  State<MenuIcon> createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => widget.scaffoldKey.currentState!.openDrawer(),
      icon: const Icon(Icons.person_outline),
    );
  }
}
