// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      id: json['id'] as int?,
      item: json['item'] == null
          ? null
          : CartItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item?.toJson(),
    };
