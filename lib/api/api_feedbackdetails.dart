import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/feedbackDetails.dart';

class APIService {
  Future<List<FeedbackModel>> DisplayRequest() async {
    final response = await http.get(Uri.parse('http://localhost:8090/api/feedback/details'),  );
    if (response.statusCode == 200 || response.statusCode == 400) {
       List<FeedbackModel> campaignModel =feedbackModelFromJson(response.body);
        print("List of Campaigns");
        print(campaignModel.length);
       return campaignModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}