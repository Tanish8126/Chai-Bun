import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/cubit/google_sign_in/google_sign_in_cubit.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_suffix_icon.dart';
import '../../../utils/size_config.dart';
import '../../../utils/socal_card.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? email;
  String? password;
  bool? remember;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool? _isSigning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  const Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kPrimaryLightColor),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: kPrimaryLightColor),
                    controller: _emailController,
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kTextColor)),
                        fillColor: kTextColor,
                        labelText: "Email",
                        hintText: "Enter your email",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon:
                            CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                        hintStyle: TextStyle(color: kPrimaryLightColor),
                        labelStyle: TextStyle(color: kPrimaryColor)),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: kPrimaryLightColor),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kTextColor)),
                        fillColor: kTextColor,
                        labelText: "Password",
                        hintText: "Enter your password",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon:
                            CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                        hintStyle: TextStyle(color: kPrimaryLightColor),
                        labelStyle: TextStyle(color: kPrimaryColor),
                      )),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Center(
                    child: InkWell(
                      onTap: () {
                        _signInUser();
                      },
                      child: Container(
                        width: double.infinity,
                        height: getProportionateScreenHeight(50),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  _isSigning == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Please wait..."),
                            SizedBox(
                              width: 10,
                            ),
                            CircularProgressIndicator()
                          ],
                        )
                      : Container(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {
                          final provider =
                              BlocProvider.of<GoogleSignInCubit>(context);
                          provider.signInWithGoogle();
                        },
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                ]),
              ),
            )));
  }

  Future _signInUser() async {
    setState(() {
      _isSigning = true;
    });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )
          .then((value) {
        setState(() {
          _isSigning = false;
        });
      });
    } catch (e) {
      // print("some error $e");
    }
  }
}
