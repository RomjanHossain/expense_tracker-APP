import 'package:expense_tracker/data/models/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_local_db_model.freezed.dart';
part 'category_local_db_model.g.dart';

/// category model for the dropdowns
@freezed
class CategoryLocalModel with _$CategoryLocalModel {
  const factory CategoryLocalModel({
    required String id,
    required String title,
    required List<CategoryModel> items,
  }) = _CategoryLocalModel;

  factory CategoryLocalModel.fromJson(Map<String, Object?> json) =>
      _$CategoryLocalModelFromJson(json);
}
