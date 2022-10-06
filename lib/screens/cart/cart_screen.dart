import 'package:flutter/material.dart';
import 'package:newcbapp/screens/cart/components/body.dart';
import 'package:newcbapp/utils/constants.dart';

import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: kMainColor,
      ),
      body: const Body(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
