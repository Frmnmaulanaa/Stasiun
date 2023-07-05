// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

List<Model> modelFromJson(String str) =>
    List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  String code;
  String name;
  String city;
  String cityname;

  Model({
    required this.code,
    required this.name,
    required this.city,
    required this.cityname,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        code: json["code"],
        name: json["name"],
        city: json["city"],
        cityname: json["cityname"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "city": city,
        "cityname": cityname,
      };
}
