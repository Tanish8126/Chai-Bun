import 'package:flutter/material.dart';
import 'package:newcbapp/screens/home/components/delivery_options.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import 'categories.dart';
import 'container.dart';
import 'discount_banner.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const DeliveryOptions(),
          const DiscountBanner(),
          const Categories(),
          SizedBox(height: getProportionateScreenWidth(10)),
          Expanded(
            child: Stack(
              children: [
                Container(
                    decoration: const BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                )),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) => const NewContainer(),
                )
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(30)),
        ],
      ),
    );
  }
}
