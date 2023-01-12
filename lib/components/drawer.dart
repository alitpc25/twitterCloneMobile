import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/globals.dart';
import 'package:flutter_twitter_clone/pages/login.dart';
import 'package:flutter_twitter_clone/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Image(
                  image: AssetImage("assets/default-avatar.png"),
                  color: Colors.white,
                  width: 80,
                ),
                Text(PreferenceUtils.getString("username"))
              ],
            ),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Sign out'),
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.remove("email");
              pref.remove("username");
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) {
                return Login();
              }));
            },
          )
        ],
      ),
    );
  }
}

class UsernameText extends StatefulWidget {
  const UsernameText({super.key});

  @override
  State<UsernameText> createState() => _UsernameTextState();
}

class _UsernameTextState extends State<UsernameText> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
