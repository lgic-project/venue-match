class LoginResponse {
  bool? error;
  String? email;
  String? password;
  String? apiKey;
  String? message;
  String? role;

  LoginResponse(
      {this.error,
      this.role,
      this.email,
      this.password,
      this.apiKey,
      this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json["error"];
    email = json["email"];
    password = json["password"];
    apiKey = json["apiKey"];
    message = json["message"];
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["error"] = error;
    data["email"] = email;
    data["password"] = password;
    data["apiKey"] = apiKey;
    data["message"] = message;
    return data;
  }
}
