
import 'dart:convert';

CustomersModel customersModelFromJson(String str) => CustomersModel.fromJson(json.decode(str));

String customersModelToJson(CustomersModel data) => json.encode(data.toJson());

class CustomersModel {
  String? entity;
  int? count;
  List<ItemModel>? items;

  CustomersModel({
    this.entity,
    this.count,
    this.items,
  });

  factory CustomersModel.fromJson(Map<String, dynamic> json) => CustomersModel(
    entity: json["entity"],
    count: json["count"],
    items: json["items"] == null ? [] : List<ItemModel>.from(json["items"]!.map((x) => ItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "entity": entity,
    "count": count,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class ItemModel {
  String? id;
  String? entity;
  String? name;
  String? email;
  String? contact;
  dynamic gstin;
  // List<dynamic>? notes;
  int? createdAt;

  ItemModel({
    this.id,
    this.entity,
    this.name,
    this.email,
    this.contact,
    this.gstin,
    // this.notes,
    this.createdAt,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    id: json["id"],
    entity: json["entity"],
    name: json["name"],
    email: json["email"],
    contact: json["contact"],
    gstin: json["gstin"],
    // notes: json["notes"] == null ? [] : List<dynamic>.from(json["notes"]!.map((x) => x)),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "entity": entity,
    "name": name,
    "email": email,
    "contact": contact,
    "gstin": gstin,
    // "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
    "created_at": createdAt,
  };
}

