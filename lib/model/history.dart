import 'package:freezed_annotation/freezed_annotation.dart';

part 'history.freezed.dart';
part 'history.g.dart';

@freezed
class History with _$History {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory History({
    required int historyId,
    required int groceryId,
    required int consumedDate,
    required int nextAllowedDate,
    required int isDeleted,
    String? groceryName
  }) = _History;

  factory History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);
}