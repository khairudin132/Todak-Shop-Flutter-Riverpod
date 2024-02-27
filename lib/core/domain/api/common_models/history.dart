import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'history.freezed.dart';
part 'history.g.dart';

@freezed
class History with _$History {
  @JsonSerializable(explicitToJson: true)
  factory History({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'product') Product? product,
    @JsonKey(name: 'viewTimes') int? viewTimes,
  }) = _History;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
