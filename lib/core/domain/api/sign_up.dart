import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up.freezed.dart';
part 'sign_up.g.dart';

@freezed
class SignUpRequest with _$SignUpRequest {
  @JsonSerializable()
  factory SignUpRequest({
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}
