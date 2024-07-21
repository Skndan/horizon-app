import 'dart:convert';

class LoginModel {
  String token;
  int expiry;
  String refreshToken;

  LoginModel({
    required this.token,
    required this.expiry,
    required this.refreshToken,
  });

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"],
    expiry: json["expiry"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expiry": expiry,
    "refreshToken": refreshToken,
  };
}
