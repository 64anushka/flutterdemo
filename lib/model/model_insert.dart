
class InsertResponseModel {
  final String token;
  final String error;

  InsertResponseModel({this.token='null', this.error='null'});

  factory InsertResponseModel.fromJson(Map<String, dynamic> json) {
    return InsertResponseModel(
      token: json["token"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class InsertRequestModel {
  late String uid;
  late String local_name;
  late String scientific_name;

InsertRequestModel(
    this.uid,
    this.local_name,   
    this.scientific_name,
);


  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'uid':uid.trim(),
      'local_name': local_name.trim(),
      'Scientific_name': scientific_name.trim(),
    };

    return map;
  }
}
