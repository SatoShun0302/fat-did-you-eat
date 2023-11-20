// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_History _$$_HistoryFromJson(Map<String, dynamic> json) => _$_History(
      historyId: json['history_id'] as int,
      groceryId: json['grocery_id'] as int,
      consumedDate: json['consumed_date'] as int,
      nextAllowedDate: json['next_allowed_date'] as int,
      isDeleted: json['is_deleted'] as int,
      groceryName: json['grocery_name'] as String?,
    );

Map<String, dynamic> _$$_HistoryToJson(_$_History instance) =>
    <String, dynamic>{
      'history_id': instance.historyId,
      'grocery_id': instance.groceryId,
      'consumed_date': instance.consumedDate,
      'next_allowed_date': instance.nextAllowedDate,
      'is_deleted': instance.isDeleted,
      'grocery_name': instance.groceryName,
    };
