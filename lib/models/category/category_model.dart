import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    required String categoryId,
    required String categoryName,
    required String uid,
    required String colorHex,
    required String icon,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  factory CategoryModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return CategoryModel(
      categoryId: doc['category_id'],
      categoryName: doc['category_name'],
      uid: doc['uid'],
      colorHex: doc['color_hex'],
      icon: doc['icon'],
    );
  }
}
