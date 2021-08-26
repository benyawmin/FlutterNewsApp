// To parse this JSON data, do
//
//     final regionModel = regionModelFromJson(jsonString);

import 'dart:convert';

RegionModel regionModelFromJson(String str) =>
    RegionModel.fromJson(json.decode(str));

String regionModelToJson(RegionModel data) => json.encode(data.toJson());

class RegionModel {
  RegionModel({
    required this.regions,
    required this.description,
    required this.status,
  });

  Regions regions;
  String description;
  String status;

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        regions: Regions.fromJson(json["regions"]),
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "regions": regions.toJson(),
        "description": description,
        "status": status,
      };
}

class Regions {
  Regions({
    required this.australia,
    required this.canada,
    required this.china,
    required this.finland,
    required this.southKorea,
    required this.taiwan,
    required this.thailand,
    required this.vietnam,
    required this.unitedState,
    required this.german,
    required this.zimbabwe,
    required this.italy,
  });

  String australia;
  String canada;
  String china;
  String finland;
  String southKorea;
  String taiwan;
  String thailand;
  String vietnam;
  String unitedState;
  String german;
  String zimbabwe;
  String italy;

  factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        australia: json["Australia"],
        canada: json["Canada"],
        china: json["China"],
        finland: json["Finland"],
        southKorea: json["South Korea"],
        taiwan: json["Taiwan"],
        thailand: json["Thailand"],
        vietnam: json["Vietnam"],
        unitedState: json["United State"],
        german: json["German"],
        zimbabwe: json["Zimbabwe"],
        italy: json["Italy"],
      );

  Map<String, dynamic> toJson() => {
        "Australia": australia,
        "Canada": canada,
        "China": china,
        "Finland": finland,
        "South Korea": southKorea,
        "Taiwan": taiwan,
        "Thailand": thailand,
        "Vietnam": vietnam,
        "United State": unitedState,
        "German": german,
        "Zimbabwe": zimbabwe,
        "Italy": italy,
      };
}
