import 'package:flutter/widgets.dart';
import 'package:newcbapp/screens/google_places_api_screen.dart';
import 'package:newcbapp/screens/home/components/search_field.dart';
import 'package:newcbapp/screens/splash_to_signup/splash/login_screen.dart';
import 'package:newcbapp/screens/user_current_location.dart';
import '../screens/Settings/settings_page.dart';
import '../screens/cart/cart_screen.dart';

import '../screens/home/home_screen.dart';
import '../screens/messages/messages_screen.dart';
import '../screens/my_account/my_account.dart';
import '../screens/notification/notification_screen.dart';
import '../screens/profile/profile_screen.dart';

import '../screens/splash_to_signup/first_screen.dart';
import '../screens/splash_to_signup/login_check/login_check.dart';
import '../screens/splash_to_signup/sign_in/sign_in_screen.dart';
import '../screens/splash_to_signup/splash/components/new_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  NewScreen.routeName: (context) => const NewScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  MessagesScreen.routeName: (context) => const MessagesScreen(),
  LoginCheck.routeName: (context) => const LoginCheck(),
  MyAccount.routeName: (context) => const MyAccount(),
  SettingsPage.routeName: (context) => const SettingsPage(),
  SearchField.routeName: (context) => const SearchField(),
  CurrentLocationScreen.routeName: (context) => const CurrentLocationScreen(),
  GooglePlacesApiScreen.routeName: (context) => const GooglePlacesApiScreen(),
};
