import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: const [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountEmail: Text("tanish@gmail.com"),
              accountName: Text("Tanish"),
            )),
        ListTile(
          leading: Icon(
            CupertinoIcons.ant_circle,
            color: Colors.black,
          ),
          title: Text(
            "Ant",
            textScaleFactor: 1.2,
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.profile_circled,
            color: Colors.black,
          ),
          title: Text(
            "Profile",
            textScaleFactor: 1.2,
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.hammer,
            color: Colors.black,
          ),
          title: Text(
            "Hammer",
            textScaleFactor: 1.2,
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.black,
          ),
          title: Text(
            "Home",
            textScaleFactor: 1.2,
          ),
        )
      ],
    ));
  }
}
