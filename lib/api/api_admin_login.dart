import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/model_Admin_login.dart';

class APIService {
  Future<LoginResponseModel> login(String email,String passward) async {
    //String url = "http://localhost:8090/api/plants/insert";

    final response = await http.post(Uri.parse('http://localhost:8090/api/plants/login'), body:json.encode({"email":email,"passward":passward}) );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }


  Future<http.Response> loginPostRequest (String email,String passward) async {
  //var url ='http://localhost:8090/api/plants/insert';
  //encode Map to JSON
  var body = json.encode({"email":email,"passward":passward,});

  var response = await http.post(Uri.parse('http://localhost:8090/api/plants/login'),// body:json.encode({"uid":uid,"local_name":localName,"scientific_name":scientificName}) ,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}
}
