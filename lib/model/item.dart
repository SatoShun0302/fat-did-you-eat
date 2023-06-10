import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Item({
    required int groceryId,
    required String groceryName,
    required int day,
    required int frequency,
    required int isDeleted
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}