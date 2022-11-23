import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/model_insert.dart';

class APIService {
  Future<InsertResponseModel> login(String uid,String localName,String scientificName) async {
    //String url = "http://localhost:8090/api/plants/insert";

    final response = await http.post(Uri.parse('http://localhost:8090/api/plants/insert'), body:json.encode({"uid":uid,"local_name":localName,"scientific_name":scientificName}) );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return InsertResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }


  Future<http.Response> insertPostRequest (String uid,String localName,String scientificName) async {
  //var url ='http://localhost:8090/api/plants/insert';
  //encode Map to JSON
  var body = json.encode({"uid":uid,"local_name":localName,"scientific_name":scientificName});

  var response = await http.post(Uri.parse('http://localhost:8090/api/plants/insert'),// body:json.encode({"uid":uid,"local_name":localName,"scientific_name":scientificName}) ,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}
}
