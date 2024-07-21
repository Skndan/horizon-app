import 'dart:convert';
/// Created by Balaji Malathi on 7/21/2024 at 20:24.

class JwtModel {
  String iss;
  String jti;
  String upn;
  List<String> groups;
  String aud;
  int exp;
  int iat;

  JwtModel({
    required this.iss,
    required this.jti,
    required this.upn,
    required this.groups,
    required this.aud,
    required this.exp,
    required this.iat,
  });

  factory JwtModel.fromRawJson(String str) => JwtModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JwtModel.fromJson(Map<String, dynamic> json) => JwtModel(
    iss: json["iss"],
    jti: json["jti"],
    upn: json["upn"],
    groups: List<String>.from(json["groups"].map((x) => x)),
    aud: json["aud"],
    exp: json["exp"],
    iat: json["iat"],
  );

  Map<String, dynamic> toJson() => {
    "iss": iss,
    "jti": jti,
    "upn": upn,
    "groups": List<dynamic>.from(groups.map((x) => x)),
    "aud": aud,
    "exp": exp,
    "iat": iat,
  };
}
