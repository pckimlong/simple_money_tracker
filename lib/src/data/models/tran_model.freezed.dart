// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tran_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TranModel _$TranModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'expenses':
      return Expenses.fromJson(json);
    case 'income':
      return Income.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TranModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TranModel {
  TranType get type => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(
      name: TranModel.dateKey,
      toJson: TranModel._dateParserToJson,
      fromJson: TranModel._dateParserFromJson)
  DateTime get date => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)
        expenses,
    required TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)
        income,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        expenses,
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        income,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        expenses,
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        income,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Expenses value) expenses,
    required TResult Function(Income value) income,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Expenses value)? expenses,
    TResult Function(Income value)? income,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expenses value)? expenses,
    TResult Function(Income value)? income,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TranModelCopyWith<TranModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranModelCopyWith<$Res> {
  factory $TranModelCopyWith(TranModel value, $Res Function(TranModel) then) =
      _$TranModelCopyWithImpl<$Res>;
  $Res call(
      {TranType type,
      String? id,
      String categoryId,
      double amount,
      @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
          DateTime date,
      String note,
      DateTime createdAt});
}

/// @nodoc
class _$TranModelCopyWithImpl<$Res> implements $TranModelCopyWith<$Res> {
  _$TranModelCopyWithImpl(this._value, this._then);

  final TranModel _value;
  // ignore: unused_field
  final $Res Function(TranModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TranType,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$ExpensesCopyWith<$Res> implements $TranModelCopyWith<$Res> {
  factory _$$ExpensesCopyWith(
          _$Expenses value, $Res Function(_$Expenses) then) =
      __$$ExpensesCopyWithImpl<$Res>;
  @override
  $Res call(
      {TranType type,
      String? id,
      String categoryId,
      double amount,
      @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
          DateTime date,
      String note,
      DateTime createdAt});
}

/// @nodoc
class __$$ExpensesCopyWithImpl<$Res> extends _$TranModelCopyWithImpl<$Res>
    implements _$$ExpensesCopyWith<$Res> {
  __$$ExpensesCopyWithImpl(_$Expenses _value, $Res Function(_$Expenses) _then)
      : super(_value, (v) => _then(v as _$Expenses));

  @override
  _$Expenses get _value => super._value as _$Expenses;

  @override
  $Res call({
    Object? type = freezed,
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$Expenses(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TranType,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Expenses extends Expenses {
  const _$Expenses(
      {this.type = TranType.expense,
      required this.id,
      required this.categoryId,
      required this.amount,
      @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
          required this.date,
      required this.note,
      required this.createdAt,
      final String? $type})
      : $type = $type ?? 'expenses',
        super._();

  factory _$Expenses.fromJson(Map<String, dynamic> json) =>
      _$$ExpensesFromJson(json);

  @override
  @JsonKey()
  final TranType type;
  @override
  final String? id;
  @override
  final String categoryId;
  @override
  final double amount;
  @override
  @JsonKey(
      name: TranModel.dateKey,
      toJson: TranModel._dateParserToJson,
      fromJson: TranModel._dateParserFromJson)
  final DateTime date;
  @override
  final String note;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TranModel.expenses(type: $type, id: $id, categoryId: $categoryId, amount: $amount, date: $date, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Expenses &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$ExpensesCopyWith<_$Expenses> get copyWith =>
      __$$ExpensesCopyWithImpl<_$Expenses>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)
        expenses,
    required TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)
        income,
  }) {
    return expenses(type, id, categoryId, amount, date, note, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        expenses,
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        income,
  }) {
    return expenses?.call(type, id, categoryId, amount, date, note, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        expenses,
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        income,
    required TResult orElse(),
  }) {
    if (expenses != null) {
      return expenses(type, id, categoryId, amount, date, note, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Expenses value) expenses,
    required TResult Function(Income value) income,
  }) {
    return expenses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Expenses value)? expenses,
    TResult Function(Income value)? income,
  }) {
    return expenses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expenses value)? expenses,
    TResult Function(Income value)? income,
    required TResult orElse(),
  }) {
    if (expenses != null) {
      return expenses(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpensesToJson(this);
  }
}

abstract class Expenses extends TranModel {
  const factory Expenses(
      {final TranType type,
      required final String? id,
      required final String categoryId,
      required final double amount,
      @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
          required final DateTime date,
      required final String note,
      required final DateTime createdAt}) = _$Expenses;
  const Expenses._() : super._();

  factory Expenses.fromJson(Map<String, dynamic> json) = _$Expenses.fromJson;

  @override
  TranType get type;
  @override
  String? get id;
  @override
  String get categoryId;
  @override
  double get amount;
  @override
  @JsonKey(
      name: TranModel.dateKey,
      toJson: TranModel._dateParserToJson,
      fromJson: TranModel._dateParserFromJson)
  DateTime get date;
  @override
  String get note;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ExpensesCopyWith<_$Expenses> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncomeCopyWith<$Res> implements $TranModelCopyWith<$Res> {
  factory _$$IncomeCopyWith(_$Income value, $Res Function(_$Income) then) =
      __$$IncomeCopyWithImpl<$Res>;
  @override
  $Res call(
      {TranType type,
      String? id,
      String categoryId,
      double amount,
      @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
          DateTime date,
      String note,
      DateTime createdAt});
}

/// @nodoc
class __$$IncomeCopyWithImpl<$Res> extends _$TranModelCopyWithImpl<$Res>
    implements _$$IncomeCopyWith<$Res> {
  __$$IncomeCopyWithImpl(_$Income _value, $Res Function(_$Income) _then)
      : super(_value, (v) => _then(v as _$Income));

  @override
  _$Income get _value => super._value as _$Income;

  @override
  $Res call({
    Object? type = freezed,
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$Income(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TranType,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Income extends Income {
  const _$Income(
      {this.type = TranType.income,
      required this.id,
      required this.categoryId,
      required this.amount,
      @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
          required this.date,
      required this.note,
      required this.createdAt,
      final String? $type})
      : $type = $type ?? 'income',
        super._();

  factory _$Income.fromJson(Map<String, dynamic> json) =>
      _$$IncomeFromJson(json);

  @override
  @JsonKey()
  final TranType type;
  @override
  final String? id;
  @override
  final String categoryId;
  @override
  final double amount;
  @override
  @JsonKey(
      name: TranModel.dateKey,
      toJson: TranModel._dateParserToJson,
      fromJson: TranModel._dateParserFromJson)
  final DateTime date;
  @override
  final String note;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TranModel.income(type: $type, id: $id, categoryId: $categoryId, amount: $amount, date: $date, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Income &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$IncomeCopyWith<_$Income> get copyWith =>
      __$$IncomeCopyWithImpl<_$Income>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)
        expenses,
    required TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)
        income,
  }) {
    return income(type, id, categoryId, amount, date, note, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        expenses,
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        income,
  }) {
    return income?.call(type, id, categoryId, amount, date, note, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        expenses,
    TResult Function(
            TranType type,
            String? id,
            String categoryId,
            double amount,
            @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
                DateTime date,
            String note,
            DateTime createdAt)?
        income,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income(type, id, categoryId, amount, date, note, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Expenses value) expenses,
    required TResult Function(Income value) income,
  }) {
    return income(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Expenses value)? expenses,
    TResult Function(Income value)? income,
  }) {
    return income?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expenses value)? expenses,
    TResult Function(Income value)? income,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeToJson(this);
  }
}

abstract class Income extends TranModel {
  const factory Income(
      {final TranType type,
      required final String? id,
      required final String categoryId,
      required final double amount,
      @JsonKey(name: TranModel.dateKey, toJson: TranModel._dateParserToJson, fromJson: TranModel._dateParserFromJson)
          required final DateTime date,
      required final String note,
      required final DateTime createdAt}) = _$Income;
  const Income._() : super._();

  factory Income.fromJson(Map<String, dynamic> json) = _$Income.fromJson;

  @override
  TranType get type;
  @override
  String? get id;
  @override
  String get categoryId;
  @override
  double get amount;
  @override
  @JsonKey(
      name: TranModel.dateKey,
      toJson: TranModel._dateParserToJson,
      fromJson: TranModel._dateParserFromJson)
  DateTime get date;
  @override
  String get note;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$IncomeCopyWith<_$Income> get copyWith =>
      throw _privateConstructorUsedError;
}
