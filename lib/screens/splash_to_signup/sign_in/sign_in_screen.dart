// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/socal_card.dart';
import '../../../models/cubit/google_sign_in/google_sign_in_cubit.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback onTapClickListener;
  const SignInScreen({Key? key, required this.onTapClickListener})
      : super(key: key);
  static String routeName = "/sign_in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                  Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kPrimaryLightColor),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: kPrimaryLightColor),
                    controller: _emailController,
                    decoration: InputDecoration(
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

//       onSaved: (newValue) => email = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         } else if (emailValidatorRegExp.hasMatch(value)) {
//           removeError(error: kInvalidEmailError);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         } else if (!emailValidatorRegExp.hasMatch(value)) {
//           addError(error: kInvalidEmailError);
//           return "";
//         }
//         return null;

//   }
// }

                  SizedBox(height: getProportionateScreenHeight(30)),
                  TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(color: kPrimaryLightColor),
                      decoration: InputDecoration(
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
                  //SizedBox(height: getProportionateScreenHeight(20)),
                  _isSigning == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Please wait..."),
                            SizedBox(
                              width: 10,
                            ),
                            CircularProgressIndicator()
                          ],
                        )
                      : Container(),
                  SizedBox(height: getProportionateScreenHeight(20)),

                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       value: remember,
                  //       checkColor: Colors.black,
                  //       side: BorderSide(color: kTextColor),
                  //       activeColor: kPrimaryColor,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           remember = value;
                  //         });
                  //       },
                  //     ),
                  //     Text(
                  //       "Remember me",
                  //       style: TextStyle(color: kPrimaryLightColor),
                  //     ),
                  //     Spacer(),
                  //     GestureDetector(
                  //       onTap: () => Navigator.pushNamed(
                  //           context, ForgotPasswordScreen.routeName),
                  //       child: Text(
                  //         "Forgot Password",
                  //         style: TextStyle(
                  //             decoration: TextDecoration.underline,
                  //             color: kPrimaryLightColor),
                  //       ),
                  //     )
                  //   ],
                  // ),

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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: kPrimaryLightColor),
                      ),
                      InkWell(
                        onTap: widget.onTapClickListener,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
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
      print("some error $e");
    }
  }
}
//               
//               ),
//               FormError(errors: errors),
//
//               D
//              
//               NoAccountText(),
//             ],
//           )),
//         ),
//       ),
//     );
//   }

//