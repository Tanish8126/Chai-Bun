import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcbapp/controller/homescreen_controller.dart';
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
    final controller = Get.put(HomeScreenController());
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const DeliveryOptions(),
            const DiscountBanner(),
            const Categories(),
            SizedBox(height: getProportionateScreenWidth(10)),
            SingleChildScrollView(
              child: Expanded(
                child: Stack(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                        ),
                        child:
                            GetBuilder<HomeScreenController>(builder: (value) {
                          if (!value.isLoading) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                controller.productsData.length,
                                (index) => NewContainer(
                                  serves: controller.productsData[index].serves,
                                  size: controller.productsData[index].size,
                                  price: controller.productsData[index].price,
                                  image: controller.productsData[index].image,
                                  name: controller.productsData[index].name,
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })),
                    SizedBox(height: getProportionateScreenWidth(30)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
