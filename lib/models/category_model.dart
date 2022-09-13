import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String text;
  final String imageUrl;
  final int index;

  Category({
    required this.id,
    required this.text,
    required this.imageUrl,
    required this.index,
  });

  @override
  List<Object?> get props => [id, text, imageUrl, index];

  factory Category.fromSnapshot(Map<String, dynamic> snap) {
    return Category(
      id: snap['id'].toString(),
      text: snap['name'],
      imageUrl: snap['imageUrl'],
      index: snap['index'],
    );
  }

  static List<Category> categories = [
    Category(
      id: '1',
      text: 'Best Seller',
      imageUrl: 'assets/juice.png',
      index: 0,
    ),
    Category(
      id: '2',
      text: 'Chai',
      imageUrl: 'assets/pizza.png',
      index: 1,
    ),
    Category(
      id: '3',
      text: 'Coffee',
      imageUrl: 'assets/burger.png',
      index: 2,
    ),
    Category(
      id: '4',
      text: 'Bun',
      imageUrl: 'assets/pancake.png',
      index: 3,
    ),
    Category(
      id: '5',
      text: 'More',
      imageUrl: 'assets/avocado.png',
      index: 4,
    ),
  ];
}
