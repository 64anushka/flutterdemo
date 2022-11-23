import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/plantModel.dart';

class APIService {
  Future<List<PlantModel>> searchbyNamePostRequest(String localName) async {
   final response = await http.post(Uri.parse('http://localhost:8090/api/plants/searchbyname'),headers: {"Content-Type": "application/json"}, body:json.encode({"local_name":localName}) );
    if ((response.statusCode == 200 || response.statusCode == 400) && response.body != null) {
       List<PlantModel> plantModel =plantModelFromJson(response.body);
        print("List of plants");
        print(plantModel.length);
       return plantModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }


//   Future<http.Response> searchbyNamePostRequest (String localName) async {
//   //var url ='http://localhost:8090/api/plants/searchbyname';
//   //encode Map to JSON
//   var body = json.encode({"local_name":localName});

//   var response = await http.post(Uri.parse('http://localhost:8090/api/plants/searchbyname'),// body:json.encode({"uid":uid,"local_name":localName,"scientific_name":scientificName}) ,
//       headers: {"Content-Type": "application/json"},
//       body: body
//   );
//   print("${response.statusCode}");
//   print("${response.body}");
//   return response;
// }
}
