class CampaignResponseModel {
  final String token;
  final String error;

  CampaignResponseModel({this.token='null', this.error='null'});

  factory CampaignResponseModel.fromJson(Map<String, dynamic> json) {
    return CampaignResponseModel(
      token: json["token"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class CampaignRequestModel {
  late String cdate;
  late String clocation;
  late String ctype;
CampaignRequestModel(
    this.cdate,
    this.clocation,
    this.ctype   
);

Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'cdate': cdate.trim(),
      'clocation': clocation.trim(),
      'ctype':ctype.trim()
    };
    return map;
  }
}
