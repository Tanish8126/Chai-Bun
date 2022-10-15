import 'package:flutter/material.dart';
import 'package:newcbapp/screens/google_places_api_screen.dart';
import 'package:newcbapp/screens/home/components/search_field.dart';
import 'package:newcbapp/utils/constants.dart';

import '../../utils/coustom_bottom_nav_bar.dart';
import '../../utils/enums.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: GestureDetector(
            onTap: (() {
              Navigator.pushNamed(context, GooglePlacesApiScreen.routeName);
            }),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text("Deliver To",
                        style: TextStyle(color: kPrimaryLightColor)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Yelahanka",
                      style: TextStyle(fontSize: 16, color: kPrimaryLightColor),
                    )),
              ],
            ),
          ),
          leading: Container(
            padding: const EdgeInsets.all(6),
            child: Image.asset(
              "assets/images/icon.png",
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SearchField.routeName);
                },
                child: const Icon(
                  Icons.search,
                  color: kPrimaryLightColor,
                  size: 40,
                ),
              ),
            ),
          ]),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
