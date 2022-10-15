import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:newcbapp/controller/homescreen_controller.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Best Seller"},
      {"icon": "assets/icons/tea.svg", "text": "Chai"},
      {"icon": "assets/icons/coffee.svg", "text": "Coffee"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Bun"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: GetBuilder<HomeScreenController>(builder: (value) {
          if (!value.isLoading) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                controller.categoriesData.length,
                (index) => CategoryCard(
                  icon: categories[index]["icon"],
                  text: controller.categoriesData[index].title,
                  press: () {
                    Navigator.pushNamed(
                        context, '../../home/components/container.dart');
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(45),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
