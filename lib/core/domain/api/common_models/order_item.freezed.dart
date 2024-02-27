// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  @JsonKey(name: 'carts')
  List<Cart>? get carts => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  Address? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPrice')
  int? get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'carts') List<Cart>? carts,
      @JsonKey(name: 'address') Address? address,
      @JsonKey(name: 'totalPrice') int? totalPrice,
      @JsonKey(name: 'createdAt') DateTime? createdAt});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = freezed,
    Object? address = freezed,
    Object? totalPrice = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      carts: freezed == carts
          ? _value.carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<Cart>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'carts') List<Cart>? carts,
      @JsonKey(name: 'address') Address? address,
      @JsonKey(name: 'totalPrice') int? totalPrice,
      @JsonKey(name: 'createdAt') DateTime? createdAt});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = freezed,
    Object? address = freezed,
    Object? totalPrice = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$OrderItemImpl(
      carts: freezed == carts
          ? _value._carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<Cart>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrderItemImpl implements _OrderItem {
  _$OrderItemImpl(
      {@JsonKey(name: 'carts') final List<Cart>? carts,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'totalPrice') this.totalPrice,
      @JsonKey(name: 'createdAt') this.createdAt})
      : _carts = carts;

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  final List<Cart>? _carts;
  @override
  @JsonKey(name: 'carts')
  List<Cart>? get carts {
    final value = _carts;
    if (value == null) return null;
    if (_carts is EqualUnmodifiableListView) return _carts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'address')
  final Address? address;
  @override
  @JsonKey(name: 'totalPrice')
  final int? totalPrice;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'OrderItem(carts: $carts, address: $address, totalPrice: $totalPrice, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            const DeepCollectionEquality().equals(other._carts, _carts) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_carts),
      address,
      totalPrice,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(
      this,
    );
  }
}

abstract class _OrderItem implements OrderItem {
  factory _OrderItem(
      {@JsonKey(name: 'carts') final List<Cart>? carts,
      @JsonKey(name: 'address') final Address? address,
      @JsonKey(name: 'totalPrice') final int? totalPrice,
      @JsonKey(name: 'createdAt') final DateTime? createdAt}) = _$OrderItemImpl;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  @JsonKey(name: 'carts')
  List<Cart>? get carts;
  @override
  @JsonKey(name: 'address')
  Address? get address;
  @override
  @JsonKey(name: 'totalPrice')
  int? get totalPrice;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
