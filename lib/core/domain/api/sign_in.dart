// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInRequest {
  SignInRequest({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }
}
