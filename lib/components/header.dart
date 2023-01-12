import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: MenuIcon(scaffoldKey: scaffoldKey),
      centerTitle: true,
      title: const Icon(FontAwesomeIcons.twitter),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(56.0);
  }
}

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => scaffoldKey.currentState!.openDrawer(),
      icon: const Icon(Icons.person_outline),
    );
  }
}
