import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_categories.freezed.dart';
part 'get_categories.g.dart';

@freezed
class GetCategoriesResponse with _$GetCategoriesResponse {
  @JsonSerializable()
  factory GetCategoriesResponse({
    List<dynamic>? categories,
  }) = _GetCategoriesResponse;

  factory GetCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesResponseFromJson(json);
}
