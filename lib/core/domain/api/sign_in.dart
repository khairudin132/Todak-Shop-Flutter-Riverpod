import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.freezed.dart';
part 'sign_in.g.dart';

@freezed
class SignInRequest with _$SignInRequest {
  factory SignInRequest({
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'password') String? password,
  }) = _SignInRequest;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
}
