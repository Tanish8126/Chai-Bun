import 'package:flutter/material.dart';
import 'package:newcbapp/screens/cart/components/body.dart';
import 'package:newcbapp/utils/constants.dart';

import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: kMainColor,
      ),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}
