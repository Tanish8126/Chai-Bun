import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/profile/profile_screen.dart';
import 'enums.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/messages/messages_screen.dart';
import 'constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = kPrimaryLightColor;
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 0),
      alignment: Alignment.center,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFF2a180d),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              color: MenuState.home == selectedMenu
                  ? kPrimaryColor
                  : inActiveIconColor,
            ),
            onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              color: MenuState.message == selectedMenu
                  ? kPrimaryColor
                  : inActiveIconColor,
            ),
            onPressed: () =>
                Navigator.pushNamed(context, MessagesScreen.routeName),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset("assets/icons/Cart Icon.svg",
                color: MenuState.cart == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor),
            onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: MenuState.profile == selectedMenu
                  ? kPrimaryColor
                  : inActiveIconColor,
            ),
            onPressed: () =>
                Navigator.pushNamed(context, ProfileScreen.routeName),
          ),
        ],
      ),
    );
  }
}
