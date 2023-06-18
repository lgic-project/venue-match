class LoginResponse {
  bool? error;
  String? email;
  String? password;
  String? apiKey;
  String? message;

  LoginResponse(
      {this.error, this.email, this.password, this.apiKey, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json["error"];
    email = json["email"];
    password = json["password"];
    apiKey = json["apiKey"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["error"] = error;
    _data["email"] = email;
    _data["password"] = password;
    _data["apiKey"] = apiKey;
    _data["message"] = message;
    return _data;
  }
}
