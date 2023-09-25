class RestaurantModel {
  List<Restaurant>? restaurant;

  RestaurantModel({this.restaurant});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    if (json['restaurant'] != null) {
      restaurant = <Restaurant>[];
      json['restaurant'].forEach((v) {
        restaurant!.add(Restaurant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (restaurant != null) {
      data['restaurant'] = restaurant!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurant {
  int? id;
  String? name;
  String? category;
  String? address;
  String? phoneNumber;
  double? rating;
  bool? favorited;
  String? logoImage;
  String? demoImage;

  Restaurant(
      {this.id,
      this.name,
      this.category,
      this.address,
      this.phoneNumber,
      this.rating,
      this.favorited,
      this.logoImage,
      this.demoImage});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    rating = json['rating'];
    favorited = json['favorited'];
    logoImage = json['logoImage'];
    demoImage = json['demoImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['rating'] = rating;
    data['favorited'] = favorited;
    data['logoImage'] = logoImage;
    data['demoImage'] = demoImage;
    return data;
  }
}
