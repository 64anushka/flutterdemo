import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/feedbackInsert.dart';

class APIService {
  Future<FeedbackResponseModel> insert(String fname,String feedback) async {
    //String url = "http://localhost:8090/api/plants/insert";

    final response = await http.post(Uri.parse('http://localhost:8090/api/feedback/insert'), body:json.encode({"fname":fname,"feedback":feedback}) );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return FeedbackResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }


  Future<http.Response> insertFeedbackPostRequest (String fname,String feedback) async {
  //var url ='http://localhost:8090/api/plants/insert';
  //encode Map to JSON
  var body = json.encode({"fname": fname,"feedback":feedback});

  var response = await http.post(Uri.parse('http://localhost:8090/api/feedback/insert'),// body:json.encode({"uid":uid,"local_name":localName,"scientific_name":scientificName}) ,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}
}
