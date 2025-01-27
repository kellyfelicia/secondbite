import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  String id;
  String name;
  String image;
  bool isFeatured;
  String parentId;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  static CategoriesModel empty() =>
      CategoriesModel(id: '', name: '', image: '', isFeatured: false);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
    };
  }

  factory CategoriesModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return CategoriesModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        parentId: data['ParentId'] ?? '',
      );
    } else {
      return CategoriesModel.empty();
    }
  }
}
