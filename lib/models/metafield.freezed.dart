// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metafield.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Metafield {
  int get id => throw _privateConstructorUsedError;
  int get variantId => throw _privateConstructorUsedError;
  String get inStock => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get memberPrice => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  String get thcPercentage => throw _privateConstructorUsedError;
  String get cbdPercentage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MetafieldCopyWith<Metafield> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetafieldCopyWith<$Res> {
  factory $MetafieldCopyWith(Metafield value, $Res Function(Metafield) then) =
      _$MetafieldCopyWithImpl<$Res, Metafield>;
  @useResult
  $Res call(
      {int id,
      int variantId,
      String inStock,
      String price,
      String memberPrice,
      String quantity,
      String thcPercentage,
      String cbdPercentage});
}

/// @nodoc
class _$MetafieldCopyWithImpl<$Res, $Val extends Metafield>
    implements $MetafieldCopyWith<$Res> {
  _$MetafieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? variantId = null,
    Object? inStock = null,
    Object? price = null,
    Object? memberPrice = null,
    Object? quantity = null,
    Object? thcPercentage = null,
    Object? cbdPercentage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      memberPrice: null == memberPrice
          ? _value.memberPrice
          : memberPrice // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      thcPercentage: null == thcPercentage
          ? _value.thcPercentage
          : thcPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      cbdPercentage: null == cbdPercentage
          ? _value.cbdPercentage
          : cbdPercentage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetafieldImplCopyWith<$Res>
    implements $MetafieldCopyWith<$Res> {
  factory _$$MetafieldImplCopyWith(
          _$MetafieldImpl value, $Res Function(_$MetafieldImpl) then) =
      __$$MetafieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int variantId,
      String inStock,
      String price,
      String memberPrice,
      String quantity,
      String thcPercentage,
      String cbdPercentage});
}

/// @nodoc
class __$$MetafieldImplCopyWithImpl<$Res>
    extends _$MetafieldCopyWithImpl<$Res, _$MetafieldImpl>
    implements _$$MetafieldImplCopyWith<$Res> {
  __$$MetafieldImplCopyWithImpl(
      _$MetafieldImpl _value, $Res Function(_$MetafieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? variantId = null,
    Object? inStock = null,
    Object? price = null,
    Object? memberPrice = null,
    Object? quantity = null,
    Object? thcPercentage = null,
    Object? cbdPercentage = null,
  }) {
    return _then(_$MetafieldImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      memberPrice: null == memberPrice
          ? _value.memberPrice
          : memberPrice // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      thcPercentage: null == thcPercentage
          ? _value.thcPercentage
          : thcPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      cbdPercentage: null == cbdPercentage
          ? _value.cbdPercentage
          : cbdPercentage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MetafieldImpl with DiagnosticableTreeMixin implements _Metafield {
  const _$MetafieldImpl(
      {required this.id,
      required this.variantId,
      required this.inStock,
      required this.price,
      required this.memberPrice,
      required this.quantity,
      required this.thcPercentage,
      required this.cbdPercentage});

  @override
  final int id;
  @override
  final int variantId;
  @override
  final String inStock;
  @override
  final String price;
  @override
  final String memberPrice;
  @override
  final String quantity;
  @override
  final String thcPercentage;
  @override
  final String cbdPercentage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Metafield(id: $id, variantId: $variantId, inStock: $inStock, price: $price, memberPrice: $memberPrice, quantity: $quantity, thcPercentage: $thcPercentage, cbdPercentage: $cbdPercentage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Metafield'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('variantId', variantId))
      ..add(DiagnosticsProperty('inStock', inStock))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('memberPrice', memberPrice))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('thcPercentage', thcPercentage))
      ..add(DiagnosticsProperty('cbdPercentage', cbdPercentage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetafieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.memberPrice, memberPrice) ||
                other.memberPrice == memberPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.thcPercentage, thcPercentage) ||
                other.thcPercentage == thcPercentage) &&
            (identical(other.cbdPercentage, cbdPercentage) ||
                other.cbdPercentage == cbdPercentage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, variantId, inStock, price,
      memberPrice, quantity, thcPercentage, cbdPercentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetafieldImplCopyWith<_$MetafieldImpl> get copyWith =>
      __$$MetafieldImplCopyWithImpl<_$MetafieldImpl>(this, _$identity);
}

abstract class _Metafield implements Metafield {
  const factory _Metafield(
      {required final int id,
      required final int variantId,
      required final String inStock,
      required final String price,
      required final String memberPrice,
      required final String quantity,
      required final String thcPercentage,
      required final String cbdPercentage}) = _$MetafieldImpl;

  @override
  int get id;
  @override
  int get variantId;
  @override
  String get inStock;
  @override
  String get price;
  @override
  String get memberPrice;
  @override
  String get quantity;
  @override
  String get thcPercentage;
  @override
  String get cbdPercentage;
  @override
  @JsonKey(ignore: true)
  _$$MetafieldImplCopyWith<_$MetafieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
