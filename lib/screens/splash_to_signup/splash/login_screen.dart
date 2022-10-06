import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/loginscreen";

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
