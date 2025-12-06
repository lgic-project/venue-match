class BookedVenues {
  String? name;
  String? location;
  int? price;
  String? image;

  BookedVenues({this.name, this.location, this.price, this.image});

  BookedVenues.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    location = json["location"];
    price = json["price"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["location"] = location;
    data["price"] = price;
    data["image"] = image;
    return data;
  }
}

class BookingModel {
  List<Bookings>? bookings;
  bool? error;
  String? message;

  BookingModel({this.bookings, this.error, this.message});

  BookingModel.fromJson(Map<String, dynamic> json) {
    bookings = json["bookings"] == null
        ? null
        : (json["bookings"] as List).map((e) => Bookings.fromJson(e)).toList();
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bookings != null) {
      data["bookings"] = bookings?.map((e) => e.toJson()).toList();
    }
    data["error"] = error;
    data["message"] = message;
    return data;
  }
}

class Bookings {
  int? id;
  String? bookedDate;
  String? person;
  int? venuePrice;
  int? totalAmount;
  String? paymentMedium;
  String? status;
  int? categoryId;
  int? venueId;
  List<BookedVenues>? venues;
  String? category;

  Bookings(
      {this.id,
      this.bookedDate,
      this.person,
      this.venuePrice,
      this.totalAmount,
      this.paymentMedium,
      this.status,
      this.categoryId,
      this.venueId,
      this.venues,
      this.category});

  Bookings.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    bookedDate = json["booked_date"];
    person = json["person"];
    venuePrice = json["venue_price"];
    totalAmount = json["total_amount"];
    paymentMedium = json["payment_medium"];
    status = json["status"];
    categoryId = json["category_id"];
    venueId = json["venue_id"];
    venues = json["venues"] == null
        ? null
        : (json["venues"] as List)
            .map((e) => BookedVenues.fromJson(e))
            .toList();
    category = json["category"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["booked_date"] = bookedDate;
    data["person"] = person;
    data["venue_price"] = venuePrice;
    data["total_amount"] = totalAmount;
    data["payment_medium"] = paymentMedium;
    data["status"] = status;
    data["category_id"] = categoryId;
    data["venue_id"] = venueId;
    if (venues != null) {
      data["venues"] = venues?.map((e) => e.toJson()).toList();
    }
    data["category"] = category;
    return data;
  }
}
