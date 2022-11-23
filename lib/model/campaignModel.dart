import 'dart:convert';

List<CampaignModel> campaignModelFromJson(String str) =>
    List<CampaignModel>.from(json.decode(str).map((x) => CampaignModel.fromJson(x)));

class CampaignModel {
  CampaignModel({
    required this.cdate,
    required this.clocation,
    required this.ctype,
  });

  String cdate;
  String clocation; 
  String ctype;
  factory CampaignModel.fromJson(Map<String, dynamic> json) => CampaignModel(
        cdate: json["cdate"],
        clocation: json["clocation"],
        ctype: json["ctype"]
     );

  Map<String, dynamic> toJson() => {
        "cdate": cdate,
        "clocation": clocation,
        "ctype":ctype
      };
}

