import 'package:flutter/material.dart';

import '../sign_in/sign_in_screen.dart';
import '../sign_up/sign_up_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    return isSignIn
        ? SignInScreen(onTapClickListener: switchPage)
        : SignUpScreen(onTapClickListener: switchPage);
  }

  switchPage() => setState(() => isSignIn = !isSignIn);
}
