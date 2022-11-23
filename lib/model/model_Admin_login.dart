class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({this.token='null', this.error='null'});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class LoginRequestModel {
  late String email;
  late String password;
  

LoginRequestModel(
    this.email,
    this.password ,  
    
);


  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email':email.trim(),
      'passward': password.trim(),
    };

    return map;
  }
}
