class FeedbackResponseModel {
  final String token;
  final String error;

  FeedbackResponseModel({this.token='null', this.error='null'});

  factory FeedbackResponseModel.fromJson(Map<String, dynamic> json) {
    return FeedbackResponseModel(
      token: json["token"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class FeedbackRequestModel {
  late String fname;
  late String feedback;
  
FeedbackRequestModel(
    this.fname,
    this.feedback,   
);

Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'fname': fname.trim(),
      'feedback': feedback.trim(),
    };
    return map;
  }
}
