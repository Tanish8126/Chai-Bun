import 'package:flutter/material.dart';

import 'components/body.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);
  static String routeName = "/myaccount";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
