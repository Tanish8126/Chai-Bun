import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/form_error.dart';
import '../../../components/socal_card.dart';
import '../../../models/cubit/google_sign_in/google_sign_in_cubit.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onTapClickListener;
  static String routeName = "/sign_up";
  const SignUpScreen({Key? key, required this.onTapClickListener})
      : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;
  String? password;
  String? confirm_password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpassController = TextEditingController();
  final List<String?> errors = [];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpassController.dispose();
    super.dispose();
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
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
                  Text("Register Account",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: getProportionateScreenWidth(28),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text("Complete your details or continue \nwith social media",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kPrimaryLightColor)),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  buildEmailFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildPasswordFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildConfirmPassFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  FormError(errors: errors),
                  Center(
                    child: InkWell(
                      onTap: () {
                        _signUpUser();
                      },
                      child: Container(
                        width: double.infinity,
                        height: getProportionateScreenHeight(50),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Sign Up",
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
                          children: [
                            Text(
                              "Please wait...",
                              style: TextStyle(color: kPrimaryLightColor),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircularProgressIndicator()
                          ],
                        )
                      : Container(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: kPrimaryLightColor),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: widget.onTapClickListener,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
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
              ))),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: kPrimaryLightColor),
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      controller: _emailController,
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kTextColor)),
          fillColor: kTextColor,
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
          hintStyle: TextStyle(color: kPrimaryLightColor),
          labelStyle: TextStyle(color: kPrimaryColor)),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        obscureText: true,
        controller: _passwordController,
        style: TextStyle(color: kPrimaryLightColor),
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
          }
          password = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            addError(error: kShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kTextColor)),
          fillColor: kTextColor,
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          hintStyle: TextStyle(color: kPrimaryLightColor),
          labelStyle: TextStyle(color: kPrimaryColor),
        ));
  }

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      obscureText: true,
      controller: _confirmpassController,
      style: TextStyle(color: kPrimaryLightColor),
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        confirm_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kTextColor)),
          labelText: "Re-Enter Password",
          hintText: "Re-Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          hintStyle: TextStyle(color: kPrimaryLightColor),
          labelStyle: TextStyle(color: kPrimaryColor)),
    );
  }

  Future _signUpUser() async {
    setState(() {
      _isSigning = true;
    });
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )
          .then((value) {
        setState(() {
          _isSigning = false;
        });
      });
    } catch (e) {
      print("error occured $e");
    }
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
