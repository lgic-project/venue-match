class VenueModel {
  List<Venues>? venues;
  bool? error;
  String? message;

  VenueModel({this.venues, this.error, this.message});

  VenueModel.fromJson(Map<String, dynamic> json) {
    venues = json["venues"] == null
        ? null
        : (json["venues"] as List).map((e) => Venues.fromJson(e)).toList();
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (venues != null) {
      data["venues"] = venues?.map((e) => e.toJson()).toList();
    }
    data["error"] = error;
    data["message"] = message;
    return data;
  }
}

class Venues {
  int? id;
  String? name;
  String? location;
  int? price;
  String? description;
  String? capacity;
  String? image;
  int? categoryId;
  List<Dishes>? dishes;

  Venues(
      {this.id,
      this.name,
      this.location,
      this.price,
      this.description,
      this.capacity,
      this.image,
      this.categoryId,
      this.dishes});

  Venues.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    price = json["price"];
    description = json["description"];
    capacity = json["capacity"];
    image = json["image"];
    categoryId = json["category_id"];
    dishes = json["dishes"] == null
        ? null
        : (json["dishes"] as List).map((e) => Dishes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["location"] = location;
    data["price"] = price;
    data["description"] = description;
    data["capacity"] = capacity;
    data["image"] = image;
    data["category_id"] = categoryId;
    if (dishes != null) {
      data["dishes"] = dishes?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Dishes {
  String? dishType;
  String? dishName;

  Dishes({this.dishType, this.dishName});

  Dishes.fromJson(Map<String, dynamic> json) {
    dishType = json["dish_type"];
    dishName = json["dish_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["dish_type"] = dishType;
    data["dish_name"] = dishName;
    return data;
  }
}
