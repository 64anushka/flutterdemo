import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/campaignModelInsert.dart';

class APIService {
  Future<CampaignResponseModel> insert(String cdate,String clocation,String ctype) async {
    //String url = "http://localhost:8090/api/plants/insert";

    final response = await http.post(Uri.parse('http://localhost:8090/api/campaign/insert'), body:json.encode({"cdate":cdate,"clocation":clocation, "ctype" :ctype}) );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return CampaignResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }


  Future<http.Response> insertCampaignPostRequest (String cdate,String clocation,String ctype) async {
  //var url ='http://localhost:8090/api/plants/insert';
  //encode Map to JSON
  var body = json.encode({"cdate": cdate,"clocation":clocation, "ctype":ctype});

  var response = await http.post(Uri.parse('http://localhost:8090/api/campaign/insert'),// body:json.encode({"uid":uid,"local_name":localName,"scientific_name":scientificName}) ,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}
}
