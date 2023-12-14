// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_local_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryLocalModelImpl _$$CategoryLocalModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryLocalModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryLocalModelImplToJson(
        _$CategoryLocalModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'items': instance.items,
    };
