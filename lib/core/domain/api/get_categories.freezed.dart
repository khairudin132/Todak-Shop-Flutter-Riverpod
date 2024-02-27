// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCategoriesResponse _$GetCategoriesResponseFromJson(
    Map<String, dynamic> json) {
  return _GetCategoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$GetCategoriesResponse {
  List<dynamic>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCategoriesResponseCopyWith<GetCategoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCategoriesResponseCopyWith<$Res> {
  factory $GetCategoriesResponseCopyWith(GetCategoriesResponse value,
          $Res Function(GetCategoriesResponse) then) =
      _$GetCategoriesResponseCopyWithImpl<$Res, GetCategoriesResponse>;
  @useResult
  $Res call({List<dynamic>? categories});
}

/// @nodoc
class _$GetCategoriesResponseCopyWithImpl<$Res,
        $Val extends GetCategoriesResponse>
    implements $GetCategoriesResponseCopyWith<$Res> {
  _$GetCategoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCategoriesResponseImplCopyWith<$Res>
    implements $GetCategoriesResponseCopyWith<$Res> {
  factory _$$GetCategoriesResponseImplCopyWith(
          _$GetCategoriesResponseImpl value,
          $Res Function(_$GetCategoriesResponseImpl) then) =
      __$$GetCategoriesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? categories});
}

/// @nodoc
class __$$GetCategoriesResponseImplCopyWithImpl<$Res>
    extends _$GetCategoriesResponseCopyWithImpl<$Res,
        _$GetCategoriesResponseImpl>
    implements _$$GetCategoriesResponseImplCopyWith<$Res> {
  __$$GetCategoriesResponseImplCopyWithImpl(_$GetCategoriesResponseImpl _value,
      $Res Function(_$GetCategoriesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$GetCategoriesResponseImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$GetCategoriesResponseImpl implements _GetCategoriesResponse {
  _$GetCategoriesResponseImpl({final List<dynamic>? categories})
      : _categories = categories;

  factory _$GetCategoriesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCategoriesResponseImplFromJson(json);

  final List<dynamic>? _categories;
  @override
  List<dynamic>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetCategoriesResponse(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCategoriesResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCategoriesResponseImplCopyWith<_$GetCategoriesResponseImpl>
      get copyWith => __$$GetCategoriesResponseImplCopyWithImpl<
          _$GetCategoriesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCategoriesResponseImplToJson(
      this,
    );
  }
}

abstract class _GetCategoriesResponse implements GetCategoriesResponse {
  factory _GetCategoriesResponse({final List<dynamic>? categories}) =
      _$GetCategoriesResponseImpl;

  factory _GetCategoriesResponse.fromJson(Map<String, dynamic> json) =
      _$GetCategoriesResponseImpl.fromJson;

  @override
  List<dynamic>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$GetCategoriesResponseImplCopyWith<_$GetCategoriesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
