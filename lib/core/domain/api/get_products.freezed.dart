// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetProductsResponse _$GetProductsResponseFromJson(Map<String, dynamic> json) {
  return _GetProductsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetProductsResponse {
  @JsonKey(name: 'products')
  List<Product>? get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetProductsResponseCopyWith<GetProductsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductsResponseCopyWith<$Res> {
  factory $GetProductsResponseCopyWith(
          GetProductsResponse value, $Res Function(GetProductsResponse) then) =
      _$GetProductsResponseCopyWithImpl<$Res, GetProductsResponse>;
  @useResult
  $Res call({@JsonKey(name: 'products') List<Product>? products});
}

/// @nodoc
class _$GetProductsResponseCopyWithImpl<$Res, $Val extends GetProductsResponse>
    implements $GetProductsResponseCopyWith<$Res> {
  _$GetProductsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetProductsResponseImplCopyWith<$Res>
    implements $GetProductsResponseCopyWith<$Res> {
  factory _$$GetProductsResponseImplCopyWith(_$GetProductsResponseImpl value,
          $Res Function(_$GetProductsResponseImpl) then) =
      __$$GetProductsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'products') List<Product>? products});
}

/// @nodoc
class __$$GetProductsResponseImplCopyWithImpl<$Res>
    extends _$GetProductsResponseCopyWithImpl<$Res, _$GetProductsResponseImpl>
    implements _$$GetProductsResponseImplCopyWith<$Res> {
  __$$GetProductsResponseImplCopyWithImpl(_$GetProductsResponseImpl _value,
      $Res Function(_$GetProductsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
  }) {
    return _then(_$GetProductsResponseImpl(
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetProductsResponseImpl implements _GetProductsResponse {
  _$GetProductsResponseImpl(
      {@JsonKey(name: 'products') final List<Product>? products})
      : _products = products;

  factory _$GetProductsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetProductsResponseImplFromJson(json);

  final List<Product>? _products;
  @override
  @JsonKey(name: 'products')
  List<Product>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetProductsResponse(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsResponseImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsResponseImplCopyWith<_$GetProductsResponseImpl> get copyWith =>
      __$$GetProductsResponseImplCopyWithImpl<_$GetProductsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetProductsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetProductsResponse implements GetProductsResponse {
  factory _GetProductsResponse(
          {@JsonKey(name: 'products') final List<Product>? products}) =
      _$GetProductsResponseImpl;

  factory _GetProductsResponse.fromJson(Map<String, dynamic> json) =
      _$GetProductsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'products')
  List<Product>? get products;
  @override
  @JsonKey(ignore: true)
  _$$GetProductsResponseImplCopyWith<_$GetProductsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
