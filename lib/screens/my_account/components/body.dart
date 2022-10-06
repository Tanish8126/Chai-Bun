import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newcbapp/utils/constants.dart';

import '../../../utils/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final Mobile = FirebaseAuth.instance.currentUser!.phoneNumber;

  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
          }).toList();

          return Scaffold(
            body: Container(
              padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: [
                      const Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      buildTextField("Full Name", "Rahul Gupta", false),
                      buildTextField("Mobile Number", "$Mobile", false),
                      buildTextField("E-mail", "rahul@gmail.com", false),
                      buildTextField("Password", "********", true),
                      buildTextField("Location", "Yelahanka, Bangalore", false),
                      const SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            height: getProportionateScreenHeight(50),
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        style: const TextStyle(color: kPrimaryLightColor),
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kTextColor)),
            labelStyle: const TextStyle(color: kPrimaryColor),
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye,
                        color: kPrimaryLightColor),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kPrimaryLightColor)),
      ),
    );
  }
}
