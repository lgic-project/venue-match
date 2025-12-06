class UserModel {
  bool? error;
  String? firstname;
  String? lastname;
  String? email;
  String? role;
  String? profilePic;
  String? message;

  UserModel(
      {this.error,
      this.firstname,
      this.lastname,
      this.email,
      this.role,
      this.profilePic,
      this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    error = json["error"];
    firstname = json["firstname"];
    lastname = json["lastname"];
    email = json["email"];
    role = json["role"];
    profilePic = json["profilePic"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["error"] = error;
    data["firstname"] = firstname;
    data["lastname"] = lastname;
    data["email"] = email;
    data["role"] = role;
    data["profilePic"] = profilePic;
    data["message"] = message;
    return data;
  }
}
