
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class RecipeModel {
  int? id;
  String title;
  String description;
  String? image;
  String category;
  RxBool isFavorite; // لتحديد إذا كان المنتج في المفضلة أم لا

  RecipeModel({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    this.image,
    bool isFavorite = false,
  }) : isFavorite = RxBool(isFavorite);

  // تحويل البيانات إلى خريطة
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'image': image,
      'isFavorite': isFavorite.value ? 1 : 0,
    };
  }

  // تحويل الخريطة إلى كائن
  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      image: map['image'],
      isFavorite: map['isFavorite'] == 1,
    );
  }
}
