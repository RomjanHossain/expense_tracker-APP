// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_local_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryLocalModel _$CategoryLocalModelFromJson(Map<String, dynamic> json) {
  return _CategoryLocalModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryLocalModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<CategoryModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryLocalModelCopyWith<CategoryLocalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryLocalModelCopyWith<$Res> {
  factory $CategoryLocalModelCopyWith(
          CategoryLocalModel value, $Res Function(CategoryLocalModel) then) =
      _$CategoryLocalModelCopyWithImpl<$Res, CategoryLocalModel>;
  @useResult
  $Res call({String id, String title, List<CategoryModel> items});
}

/// @nodoc
class _$CategoryLocalModelCopyWithImpl<$Res, $Val extends CategoryLocalModel>
    implements $CategoryLocalModelCopyWith<$Res> {
  _$CategoryLocalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryLocalModelImplCopyWith<$Res>
    implements $CategoryLocalModelCopyWith<$Res> {
  factory _$$CategoryLocalModelImplCopyWith(_$CategoryLocalModelImpl value,
          $Res Function(_$CategoryLocalModelImpl) then) =
      __$$CategoryLocalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, List<CategoryModel> items});
}

/// @nodoc
class __$$CategoryLocalModelImplCopyWithImpl<$Res>
    extends _$CategoryLocalModelCopyWithImpl<$Res, _$CategoryLocalModelImpl>
    implements _$$CategoryLocalModelImplCopyWith<$Res> {
  __$$CategoryLocalModelImplCopyWithImpl(_$CategoryLocalModelImpl _value,
      $Res Function(_$CategoryLocalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? items = null,
  }) {
    return _then(_$CategoryLocalModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryLocalModelImpl implements _CategoryLocalModel {
  const _$CategoryLocalModelImpl(
      {required this.id,
      required this.title,
      required final List<CategoryModel> items})
      : _items = items;

  factory _$CategoryLocalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryLocalModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<CategoryModel> _items;
  @override
  List<CategoryModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CategoryLocalModel(id: $id, title: $title, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryLocalModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryLocalModelImplCopyWith<_$CategoryLocalModelImpl> get copyWith =>
      __$$CategoryLocalModelImplCopyWithImpl<_$CategoryLocalModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryLocalModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryLocalModel implements CategoryLocalModel {
  const factory _CategoryLocalModel(
      {required final String id,
      required final String title,
      required final List<CategoryModel> items}) = _$CategoryLocalModelImpl;

  factory _CategoryLocalModel.fromJson(Map<String, dynamic> json) =
      _$CategoryLocalModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<CategoryModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$CategoryLocalModelImplCopyWith<_$CategoryLocalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
