import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newcbapp/utils/constants.dart';

import '../../../utils/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
            return Center(
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
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      buildTextField("Full Name", "Rahul Gupta", false),
                      buildTextField("E-mail", "rahul@gmail.com", false),
                      buildTextField("Password", "********", true),
                      buildTextField("Location", "Yelahanka, Bangalore", false),
                      SizedBox(
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
        style: TextStyle(color: kPrimaryLightColor),
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: kTextColor)),
            labelStyle: TextStyle(color: kPrimaryColor),
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye, color: kPrimaryLightColor),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kPrimaryLightColor)),
      ),
    );
  }
}
