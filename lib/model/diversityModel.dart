import 'dart:convert';

List<DiversityModel> DiversityModelFromJson(String str) =>
    List<DiversityModel>.from(json.decode(str).map((x) => DiversityModel.fromJson(x)));

class DiversityModel {
  DiversityModel({
    required this.dtotalplants,
    required this.dspeices,
  });

  String dtotalplants;
  String dspeices; 

  factory DiversityModel.fromJson(Map<String, dynamic> json) => DiversityModel(
        dtotalplants: json["dtotalplants"],
        dspeices: json["dspeices"],
     );

  Map<String, dynamic> toJson() => {
        "dtotalplants": dtotalplants,
        "dspeices": dspeices,
      };
}

