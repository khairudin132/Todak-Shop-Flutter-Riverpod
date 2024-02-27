// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProductsResponseImpl _$$GetProductsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetProductsResponseImpl(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetProductsResponseImplToJson(
        _$GetProductsResponseImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
    };
