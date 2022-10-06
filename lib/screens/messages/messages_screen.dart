import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);
  static String routeName = "/messages";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
