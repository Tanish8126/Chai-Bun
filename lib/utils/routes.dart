import 'package:flutter/widgets.dart';
import 'package:newcbapp/screens/google_places_api_screen.dart';
import 'package:newcbapp/screens/home/components/search_field.dart';
import 'package:newcbapp/screens/user_current_location.dart';
import '../screens/Settings/settings_page.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/details/details_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/messages/messages_screen.dart';
import '../screens/my_account/my_account.dart';
import '../screens/notification/notification_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/splash_to_signup/complete_profile/complete_profile_screen.dart';
import '../screens/splash_to_signup/forgot_password/forgot_password_screen.dart';
import '../screens/splash_to_signup/login_check/main_screen.dart';
import '../screens/splash_to_signup/otp/otp_screen.dart';
import '../screens/splash_to_signup/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  //SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  // SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  MessagesScreen.routeName: (context) => MessagesScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  MyAccount.routeName: (context) => MyAccount(),
  SettingsPage.routeName: (context) => SettingsPage(),
  SearchField.routeName: (context) => SearchField(),
  CurrentLocationScreen.routeName: (context) => CurrentLocationScreen(),
  GooglePlacesApiScreen.routeName: (context) => GooglePlacesApiScreen(),
};
