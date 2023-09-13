class VenueOwnerVenueModel {
  List<VenueOwnerVenues>? venues;
  bool? error;
  String? message;

  VenueOwnerVenueModel({this.venues, this.error, this.message});

  VenueOwnerVenueModel.fromJson(Map<String, dynamic> json) {
    venues = json["venues"] == null
        ? null
        : (json["venues"] as List)
            .map((e) => VenueOwnerVenues.fromJson(e))
            .toList();
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

class VenueOwnerVenues {
  int? id;
  List<Venues1>? venues;

  VenueOwnerVenues({this.id, this.venues});

  VenueOwnerVenues.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    venues = json["venues"] == null
        ? null
        : (json["venues"] as List).map((e) => Venues1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    if (venues != null) {
      data["venues"] = venues?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Venues1 {
  int? id;
  String? name;
  String? location;
  int? price;
  String? image;

  Venues1({this.id, this.name, this.location, this.price, this.image});

  Venues1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    price = json["price"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["location"] = location;
    data["price"] = price;
    data["image"] = image;
    return data;
  }
}
