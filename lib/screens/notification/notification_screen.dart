import 'package:flutter/material.dart';

import 'components/body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static String routeName = "/notification";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
