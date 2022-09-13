import 'package:flutter/material.dart';
import 'package:newcbapp/utils/size_config.dart';

import '../../../../utils/constants.dart';
import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Complete Profile",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold)),
                Text("Complete your details or continue  \nwith social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kPrimaryLightColor)),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kPrimaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
