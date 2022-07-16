// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  @JsonKey(name: CategoryModel.idKey)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: CategoryModel.nameKey)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: CategoryModel.tranTypeKey)
  TranType get tranType => throw _privateConstructorUsedError;
  int get iconIndex => throw _privateConstructorUsedError;
  int get iconColorValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: CategoryModel.idKey) String id,
      @JsonKey(name: CategoryModel.nameKey) String name,
      @JsonKey(name: CategoryModel.tranTypeKey) TranType tranType,
      int iconIndex,
      int iconColorValue});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  final CategoryModel _value;
  // ignore: unused_field
  final $Res Function(CategoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tranType = freezed,
    Object? iconIndex = freezed,
    Object? iconColorValue = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tranType: tranType == freezed
          ? _value.tranType
          : tranType // ignore: cast_nullable_to_non_nullable
              as TranType,
      iconIndex: iconIndex == freezed
          ? _value.iconIndex
          : iconIndex // ignore: cast_nullable_to_non_nullable
              as int,
      iconColorValue: iconColorValue == freezed
          ? _value.iconColorValue
          : iconColorValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$_CategoryModelCopyWith(
          _$_CategoryModel value, $Res Function(_$_CategoryModel) then) =
      __$$_CategoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: CategoryModel.idKey) String id,
      @JsonKey(name: CategoryModel.nameKey) String name,
      @JsonKey(name: CategoryModel.tranTypeKey) TranType tranType,
      int iconIndex,
      int iconColorValue});
}

/// @nodoc
class __$$_CategoryModelCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res>
    implements _$$_CategoryModelCopyWith<$Res> {
  __$$_CategoryModelCopyWithImpl(
      _$_CategoryModel _value, $Res Function(_$_CategoryModel) _then)
      : super(_value, (v) => _then(v as _$_CategoryModel));

  @override
  _$_CategoryModel get _value => super._value as _$_CategoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tranType = freezed,
    Object? iconIndex = freezed,
    Object? iconColorValue = freezed,
  }) {
    return _then(_$_CategoryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tranType: tranType == freezed
          ? _value.tranType
          : tranType // ignore: cast_nullable_to_non_nullable
              as TranType,
      iconIndex: iconIndex == freezed
          ? _value.iconIndex
          : iconIndex // ignore: cast_nullable_to_non_nullable
              as int,
      iconColorValue: iconColorValue == freezed
          ? _value.iconColorValue
          : iconColorValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryModel extends _CategoryModel {
  _$_CategoryModel(
      {@JsonKey(name: CategoryModel.idKey) required this.id,
      @JsonKey(name: CategoryModel.nameKey) required this.name,
      @JsonKey(name: CategoryModel.tranTypeKey) required this.tranType,
      required this.iconIndex,
      required this.iconColorValue})
      : super._();

  factory _$_CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryModelFromJson(json);

  @override
  @JsonKey(name: CategoryModel.idKey)
  final String id;
  @override
  @JsonKey(name: CategoryModel.nameKey)
  final String name;
  @override
  @JsonKey(name: CategoryModel.tranTypeKey)
  final TranType tranType;
  @override
  final int iconIndex;
  @override
  final int iconColorValue;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, tranType: $tranType, iconIndex: $iconIndex, iconColorValue: $iconColorValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.tranType, tranType) &&
            const DeepCollectionEquality().equals(other.iconIndex, iconIndex) &&
            const DeepCollectionEquality()
                .equals(other.iconColorValue, iconColorValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(tranType),
      const DeepCollectionEquality().hash(iconIndex),
      const DeepCollectionEquality().hash(iconColorValue));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryModelCopyWith<_$_CategoryModel> get copyWith =>
      __$$_CategoryModelCopyWithImpl<_$_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryModelToJson(this);
  }
}

abstract class _CategoryModel extends CategoryModel {
  factory _CategoryModel(
      {@JsonKey(name: CategoryModel.idKey)
          required final String id,
      @JsonKey(name: CategoryModel.nameKey)
          required final String name,
      @JsonKey(name: CategoryModel.tranTypeKey)
          required final TranType tranType,
      required final int iconIndex,
      required final int iconColorValue}) = _$_CategoryModel;
  _CategoryModel._() : super._();

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryModel.fromJson;

  @override
  @JsonKey(name: CategoryModel.idKey)
  String get id;
  @override
  @JsonKey(name: CategoryModel.nameKey)
  String get name;
  @override
  @JsonKey(name: CategoryModel.tranTypeKey)
  TranType get tranType;
  @override
  int get iconIndex;
  @override
  int get iconColorValue;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryModelCopyWith<_$_CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
