import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/diversityModel.dart';

class APIService {
  Future<List<DiversityModel>> DisplayRequest() async {
    final response = await http.get(Uri.parse('http://localhost:8090/api/diversity/details'),  );
    if (response.statusCode == 200 || response.statusCode == 400) {
       List<DiversityModel> diversityModel =DiversityModelFromJson(response.body);
        print("List of Diversity");
        print(diversityModel.length);
       return diversityModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}