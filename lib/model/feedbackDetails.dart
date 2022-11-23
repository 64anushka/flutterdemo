import 'dart:convert';

List<FeedbackModel> feedbackModelFromJson(String str) =>
    List<FeedbackModel>.from(json.decode(str).map((x) => FeedbackModel.fromJson(x)));

class FeedbackModel {
  FeedbackModel({
    required this.fname,
    required this.feedback,
  });

  String fname;
  String feedback; 

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        fname: json["fname"],
        feedback: json["feedback"],
     );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "feedback": feedback,
      };
}

