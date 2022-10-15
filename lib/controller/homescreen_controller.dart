import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:newcbapp/models/categories_model.dart';

class HomeScreenController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late List<CategoriesModel> categoriesData;
  bool isLoading = true;

  void getData() async {
    await Future.wait([getCategoryData()]).then((value) {
      //print("data");
      //print(categoriesData[0].image);
      isLoading = false;
      update();
    });
  }

  Future<void> getCategoryData() async {
    await _firestore.collection('categories').get().then((value) {
      categoriesData =
          value.docs.map((e) => CategoriesModel.fromJson(e.data())).toList();
    });
  }

  @override
  void onInit() {
    super.onInit();

    getData();
  }
}
