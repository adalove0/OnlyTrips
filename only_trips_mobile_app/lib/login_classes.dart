class Login {
  bool success;
  String message;
  User user;

  Login({this.success, this.message, this.user});

  Login.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String userId;
  int age;
  bool confirmed;
  List<TripDetails> tripDetails;
  List<Location> location;
  String email;
  String name;
  String token;

  User(
      {this.userId,
      this.age,
      this.confirmed,
      this.tripDetails,
      this.location,
      this.email,
      this.name,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['_id'];
    age = json['age'];
    confirmed = json['confirmed'];
    if (json['TripDetails'] != null) {
      tripDetails = new List<TripDetails>();
      json['TripDetails'].forEach((v) {
        tripDetails.add(new TripDetails.fromJson(v));
      });
    }
    if (json['location'] != null) {
      location = new List<Location>();
      json['location'].forEach((v) {
        location.add(new Location.fromJson(v));
      });
    }
    email = json['email'];
    name = json['name'];
    token = json['token'];
  }

  User.fromMyJson(Map<String, dynamic> json) {
    userId = json['userId'];
    age = json['age'];
    confirmed = json['confirmed'];
    if (json['TripDetails'] != null) {
      tripDetails = new List<TripDetails>();
      json['TripDetails'].forEach((v) {
        tripDetails.add(new TripDetails.fromMyJson(v));
      });
    }
    if (json['location'] != null) {
      location = new List<Location>();
      json['location'].forEach((v) {
        location.add(new Location.fromJson(v));
      });
    }
    email = json['email'];
    name = json['name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['age'] = this.age;
    data['confirmed'] = this.confirmed;
    if (this.tripDetails != null) {
      data['TripDetails'] = this.tripDetails.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['name'] = this.name;
    data['token'] = this.token;
    return data;
  }
}

class TripDetails {
  String id;

  TripDetails({this.id});

  TripDetails.fromJson(json) {
    id = json;
  }

  TripDetails.fromMyJson(Map<String, dynamic> json) {
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Location {
  String state;
  String sId;
  String city;
  String country;
  int zip;

  Location({this.state, this.sId, this.city, this.country, this.zip});

  Location.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    sId = json['_id'];
    city = json['city'];
    country = json['country'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['_id'] = this.sId;
    data['city'] = this.city;
    data['country'] = this.country;
    data['zip'] = this.zip;
    return data;
  }
}

