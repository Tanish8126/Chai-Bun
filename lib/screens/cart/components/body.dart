// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/Cart.dart';
import '../../../utils/size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(20),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Dismissible(
              key: Key(demoCarts[index].product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: CartCard(cart: demoCarts[index]),
            ),
          ),
        ),
      ),
    );
  }
}
