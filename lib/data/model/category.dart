
class CategoryModel {
  List<Categories>? categories;
  bool? error;
  String? message;

  CategoryModel({this.categories, this.error, this.message});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categories = json["categories"] == null ? null : (json["categories"] as List).map((e) => Categories.fromJson(e)).toList();
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(categories != null) {
      _data["categories"] = categories?.map((e) => e.toJson()).toList();
    }
    _data["error"] = error;
    _data["message"] = message;
    return _data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;

  Categories({this.id, this.name, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    return _data;
  }
}