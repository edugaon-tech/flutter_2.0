// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "name": name,
    "email": email,
    "phone": phone,
    "gender": gender,
  };
}
