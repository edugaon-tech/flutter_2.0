// To parse this JSON data, do
//
//     final addCustomerModel = addCustomerModelFromJson(jsonString);

import 'dart:convert';

AddCustomerModel addCustomerModelFromJson(String str) => AddCustomerModel.fromJson(json.decode(str));

String addCustomerModelToJson(AddCustomerModel data) => json.encode(data.toJson());

class AddCustomerModel {
  String? id;
  String? name;
  String? email;
  String? contact;

  AddCustomerModel({
    this.id,
    this.name,
    this.email,
    this.contact,
  });

  factory AddCustomerModel.fromJson(Map<String, dynamic> json) => AddCustomerModel(
    id:json['id'],
    name: json["name"],
    email: json["email"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "contact": contact,
  };
}
