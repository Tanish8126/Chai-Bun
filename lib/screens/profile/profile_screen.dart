import 'package:flutter/material.dart';
import 'package:newcbapp/components/coustom_bottom_nav_bar.dart';
import 'package:newcbapp/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
