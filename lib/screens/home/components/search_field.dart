import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import '../../../utils/constants.dart';

class SearchField extends StatefulWidget {
  static String routeName = "/search";
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2a180d),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 20, top: 10),
          child: TextFormField(
            style: TextStyle(color: kPrimaryLightColor),
            onChanged: (value) => print(value),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(13.5)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kTextColor)),
                // border: InputBorder.none,
                // focusedBorder: InputBorder.none,
                hintText: "Search product...",
                hintStyle: TextStyle(color: kPrimaryLightColor, fontSize: 20),
                prefixIcon: Icon(Icons.search),
                fillColor: kTextColor,
                prefixIconColor: kPrimaryColor),
          ),
        ));
  }
}
