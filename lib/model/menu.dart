
class MenuCategory {
  final String id;
  final String name;
  final List<MenuItem> items;

  MenuCategory({
    required this.id,
    required this.name,
    this.items = const [],
  });
}


class MenuItem {
  final String id;
  final String categoryId;
  final String categoryName;
  final String name;
  final String? description;
  final dynamic price;
  final String? calories;
  final String? image;
  final String imagePublicId;
  final bool isFasting;
  final bool isAvailable;
  final bool isPopular;

  MenuItem({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.name,
    required this.description,
    required this.price,
    required this.calories,
    required this.image,
    required this.imagePublicId,
    required this.isFasting,
    required this.isAvailable,
    required this.isPopular,
  });

  /// 🔥 FROM JSON (Firebase → Model)
  factory MenuItem.fromJson({
    required String id,
    required String categoryId,
    required String categoryName,
    required Map<String, dynamic> json,
  }) {
    return MenuItem(
      id: id,
      categoryId: categoryId,
      categoryName: categoryName,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'],
      imagePublicId: json['imagePublicId'] ?? '',
      calories: json['calories'] ?? '',
      image: json['image'] ?? '',
      isFasting: json['isFasting'] ?? false,
      isAvailable: json['isAvailable'] ?? true,
      isPopular: json['isPopular'] ?? false,
    );
  }

  /// 🔥 TO JSON (Model → Firebase)
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "calories": calories,
      "image": image,
      "isFasting": isFasting,
      "imagePublicId": imagePublicId,
      "isAvailable": isAvailable,
      "isPopular": isPopular,
    };
  }
}
