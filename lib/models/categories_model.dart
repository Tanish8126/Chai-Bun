class CategoriesModel {
  late String id;
  late String image;
  late String title;

  CategoriesModel({required this.id, required this.image, required this.title});

  CategoriesModel.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    image = map["img"];
    title = map["title"];
  }
}
