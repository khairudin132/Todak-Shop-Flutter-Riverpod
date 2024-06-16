import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.freezed.dart';
part 'sign_in.g.dart';

@freezed
class SignInRequest with _$SignInRequest {
  @JsonSerializable()
  factory SignInRequest({
    required String email,
    required String password,
  }) = _SignInRequest;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
}
