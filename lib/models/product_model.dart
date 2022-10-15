class ProductsModel {
  late String id;
  late String image;
  late String price;
  late String serves;
  late String size;
  late String name;
  ProductsModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.size,
      required this.price,
      required this.serves});
  ProductsModel.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    image = map["image"];
    name = map["name"];
    serves = map["serves"];
    size = map["size"];
    price = map["price"];
  }
}
