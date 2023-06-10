// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      groceryId: json['grocery_id'] as int,
      groceryName: json['grocery_name'] as String,
      day: json['day'] as int,
      frequency: json['frequency'] as int,
      isDeleted: json['is_deleted'] as int,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'grocery_id': instance.groceryId,
      'grocery_name': instance.groceryName,
      'day': instance.day,
      'frequency': instance.frequency,
      'is_deleted': instance.isDeleted,
    };
