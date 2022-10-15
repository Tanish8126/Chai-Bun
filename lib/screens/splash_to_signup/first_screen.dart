// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/default_button.dart';
import '../../utils/size_config.dart';
import 'login_check/login_check.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFF2a180d),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/headerlogo.png',
                  width: 200,
                ),
                const Spacer(flex: 2),
                const Text(
                  "Let's have a sip of tea\n with Chai Bun!",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                DefaultButton(
                  text: "Discover more ..",
                  press: () {
                    Navigator.pushNamed(context, LoginCheck.routeName);
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
