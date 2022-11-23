import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/campaignModel.dart';

class APIService {
  Future<List<CampaignModel>> DisplayRequest() async {
    final response = await http.get(Uri.parse('http://localhost:8090/api/campaign/detailsadmin'),  );
    if (response.statusCode == 200 || response.statusCode == 400) {
       List<CampaignModel> campaignModel =campaignModelFromJson(response.body);
        print("List of Campaigns");
        print(campaignModel.length);
       return campaignModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}