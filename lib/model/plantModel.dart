import 'dart:convert';

List<PlantModel> plantModelFromJson(String str) =>
    List<PlantModel>.from(json.decode(str).map((x) => PlantModel.fromJson(x)));

class PlantModel {
  PlantModel({
    required this.uid,
    required this.local_name,
    required this.scientific_name,
 
  });

  String uid;
  String local_name;
  String scientific_name; 

  factory PlantModel.fromJson(Map<String, dynamic> json) => PlantModel(
        uid: json["uid"],
        local_name: json["local_name"],
        scientific_name: json["scientific_name"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "local_name": local_name,
        "scientific_name": scientific_name,
        
      };
}

