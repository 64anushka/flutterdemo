import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/plantModel.dart';

class APIService {
  Future<List<PlantModel>> searchbyIdRequest(String uid) async {
    final response = await http.post(Uri.parse('http://localhost:8090/api/plants/searchbyid'),headers: {"Content-Type": "application/json"}, body:json.encode({"uid":uid}) );
    if (response.statusCode == 200 || response.statusCode == 400) {
       List<PlantModel> plantModel =plantModelFromJson(response.body);
        print("List of plants");
        print(plantModel.length);
       return plantModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}