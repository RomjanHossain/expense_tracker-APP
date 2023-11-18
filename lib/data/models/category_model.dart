import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.freezed.dart';
/// category model for the dropdowns
@freezed
class CategoryModel with _$CategoryModel {
 const factory CategoryModel({
    required String title,
    required IconData icon,
    required int id,
  })= _CategoryModel;
}
