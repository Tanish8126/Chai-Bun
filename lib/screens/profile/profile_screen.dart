import 'package:flutter/material.dart';
import 'package:newcbapp/components/coustom_bottom_nav_bar.dart';
import 'package:newcbapp/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
