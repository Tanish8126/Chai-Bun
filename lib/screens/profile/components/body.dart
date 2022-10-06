import 'package:flutter/material.dart';
import 'package:newcbapp/screens/google_places_api_screen.dart';

import '../../Settings/settings_page.dart';
import '../../my_account/my_account.dart';
import '../../notification/notification_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SafeArea(
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            // Expanded(
            //   child: Stack(
            //     children: [
            //       Container(
            //           decoration: BoxDecoration(
            //         color: kMainColor,
            //         borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(40),
            //             topRight: Radius.circular(40)),
            //       )),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () {
                Navigator.pushNamed(context, MyAccount.routeName);
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {
                Navigator.pushNamed(context, NotificationScreen.routeName);
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {
                Navigator.pushNamed(context, SettingsPage.routeName);
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Navigator.pushNamed(context, GooglePlacesApiScreen.routeName);
              },
            ),
            // ProfileMenu(
            //   text: "Log Out",
            //   icon: "assets/icons/Log out.svg",
            //   press: () {
            //     FirebaseAuth.instance.signOut();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
