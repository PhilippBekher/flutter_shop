// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.records,
  });

  List<Record> records;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class Record {
  Record({
    required this.id,
    required this.createdTime,
    required this.fields,
  });

  String id;
  DateTime createdTime;
  Fields fields;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        createdTime: DateTime.parse(json["createdTime"]),
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdTime": createdTime.toIso8601String(),
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.name,
    required this.picture,
    required this.description,
    required this.price,
  });

  String name;
  String picture;
  String description;
  int price;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["Name"],
        picture: json["Picture"],
        description: json["Description"],
        price: json["Price"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Picture": picture,
        "Description": description,
        "Price": price,
      };
}
