import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

/// category model for the dropdowns
@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String title,
    required String icon,
    required String id,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, Object?> json) =>
      _$CategoryModelFromJson(json);
}
