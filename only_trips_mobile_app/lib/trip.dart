class GetTrip {
  bool success;
  String message;
  Trip trip;

  GetTrip({this.success, this.message, this.trip});

  GetTrip.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    trip = json['trip'] != null ? new Trip.fromJson(json['trip']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.trip != null) {
      data['trip'] = this.trip.toJson();
    }
    return data;
  }
}
/*
class Trip {
  Id iId;
  Id creator;
  NumPeople numPeople;
  StartDate startDate;
  StartDate endDate;
  List<Destination> destination;
  List<Budget> budget;
  NumPeople nV;

  Trip(
      {this.iId,
        this.creator,
        this.numPeople,
        this.startDate,
        this.endDate,
        this.destination,
        this.budget,
        this.nV});

  Trip.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    creator = json['creator'] != null ? new Id.fromJson(json['creator']) : null;
    numPeople = json['numPeople'] != null
        ? new NumPeople.fromJson(json['numPeople'])
        : null;
    startDate = json['startDate'] != null
        ? new StartDate.fromJson(json['startDate'])
        : null;
    endDate = json['endDate'] != null
        ? new StartDate.fromJson(json['endDate'])
        : null;
    if (json['destination'] != null) {
      destination = new List<Destination>();
      json['destination'].forEach((v) {
        destination.add(new Destination.fromJson(v));
      });
    }
    if (json['budget'] != null) {
      budget = new List<Budget>();
      json['budget'].forEach((v) {
        budget.add(new Budget.fromJson(v));
      });
    }
    nV = json['__v'] != null ? new NumPeople.fromJson(json['__v']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    if (this.numPeople != null) {
      data['numPeople'] = this.numPeople.toJson();
    }
    if (this.startDate != null) {
      data['startDate'] = this.startDate.toJson();
    }
    if (this.endDate != null) {
      data['endDate'] = this.endDate.toJson();
    }
    if (this.destination != null) {
      data['destination'] = this.destination.map((v) => v.toJson()).toList();
    }
    if (this.budget != null) {
      data['budget'] = this.budget.map((v) => v.toJson()).toList();
    }
    if (this.nV != null) {
      data['__v'] = this.nV.toJson();
    }
    return data;
  }
}
*/
class Id {
  String oid;

  Id({this.oid});

  Id.fromJson(json) {
    oid = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}
class NumPeople {
  int numberInt;

  NumPeople({this.numberInt});

  NumPeople.fromJson(json) {
    numberInt = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberInt'] = this.numberInt;
    return data;
  }
}
class StartDate {
  Date date;

  StartDate({this.date});

  StartDate.fromJson(json) {
    date = (json != null) ? new Date.fromJson(json) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.date != null) {
      data['$date'] = this.date.toJson();
    }
    return data;
  }
}
class Date {
  String numberLong;

  Date({this.numberLong});

  Date.fromJson(json) {
    numberLong = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberLong'] = this.numberLong;
    return data;
  }
}
/*class Destination {
  Id iId;
  String city;
  String state;

  Destination({this.iId, this.city, this.state});

  Destination.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['city'] = this.city;
    data['state'] = this.state;
    return data;
  }
}*/
/*
class Budget {
  Id iId;
  Cost travelCost;
  Cost foodCost;
  Cost lodgingCost;
  Cost miscellaneousCost;

  Budget(
      {this.iId,
        this.travelCost,
        this.foodCost,
        this.lodgingCost,
        this.miscellaneousCost});

  Budget.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    travelCost = json['travelCost'] != null
        ? new Cost.fromJson(json['travelCost'])
        : null;
    foodCost = json['foodCost'] != null
        ? new Cost.fromJson(json['foodCost'])
        : null;
    lodgingCost = json['lodgingCost'] != null
        ? new Cost.fromJson(json['lodgingCost'])
        : null;
    miscellaneousCost = json['miscellaneousCost'] != null
        ? new Cost.fromJson(json['miscellaneousCost'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    if (this.travelCost != null) {
      data['travelCost'] = this.travelCost.toJson();
    }
    if (this.foodCost != null) {
      data['foodCost'] = this.foodCost.toJson();
    }
    if (this.lodgingCost != null) {
      data['lodgingCost'] = this.lodgingCost.toJson();
    }
    if (this.miscellaneousCost != null) {
      data['miscellaneousCost'] = this.miscellaneousCost.toJson();
    }
    return data;
  }
}
*/
class Cost {
  double numberDouble;

  Cost({this.numberDouble});

  Cost.fromJson(json) {
    numberDouble = json.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberDouble'] = this.numberDouble;
    return data;
  }

  @override toString() => numberDouble.toStringAsFixed(2);

}
/*
class Trip {
  String sId;
  String creator;
  int numPeople;
  String startDate;
  String endDate;
  List<Destination> destination;
  List<Budget> budget;
  int iV;

  Trip(
      {this.sId,
        this.creator,
        this.numPeople,
        this.startDate,
        this.endDate,
        this.destination,
        this.budget,
        this.iV});

  Trip.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    creator = json['creator'];
    numPeople = json['numPeople'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    if (json['destination'] != null) {
      destination = new List<Destination>();
      json['destination'].forEach((v) {
        destination.add(new Destination.fromJson(v));
      });
    }
    if (json['budget'] != null) {
      budget = new List<Budget>();
      json['budget'].forEach((v) {
        budget.add(new Budget.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['creator'] = this.creator;
    data['numPeople'] = this.numPeople;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    if (this.destination != null) {
      data['destination'] = this.destination.map((v) => v.toJson()).toList();
    }
    if (this.budget != null) {
      data['budget'] = this.budget.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}
*/
class Destination {
  String sId;
  String city;
  String state;

  Destination({this.sId, this.city, this.state});

  Destination.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['city'] = this.city;
    data['state'] = this.state;
    return data;
  }
}
class GetTripDetails {
  bool success;
  Trip trip;
  String message;

  GetTripDetails({this.success, this.trip, this.message});

  GetTripDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    trip = json['trip'] != null ? new Trip.fromJson(json['trip']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.trip != null) {
      data['trip'] = this.trip.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}
class Trip {
  String sId;
  String creator;
  int numPeople;
  String startDate;
  String endDate;
  List<Destination> destination;
  List<Budget> budget;
  int iV;

  @override
  bool operator ==(other) {
    return this.sId == other.sId;
  }

  @override
  int get hashCode => sId.hashCode;

  Trip(
      {this.sId,
        this.creator,
        this.numPeople,
        this.startDate,
        this.endDate,
        this.destination,
        this.budget,
        this.iV});

  Trip.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    creator = json['creator'];
    numPeople = json['numPeople'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    if (json['destination'] != null) {
      destination = new List<Destination>();
      json['destination'].forEach((v) {
        destination.add(new Destination.fromJson(v));
      });
    }
    if (json['budget'] != null) {
      budget = new List<Budget>();
      json['budget'].forEach((v) {
        budget.add(new Budget.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['creator'] = this.creator;
    data['numPeople'] = this.numPeople;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    if (this.destination != null) {
      data['destination'] = this.destination.map((v) => v.toJson()).toList();
    }
    if (this.budget != null) {
      data['budget'] = this.budget.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}
class Budget {
  String sId;
  double travelCost;
  double foodCost;
  double lodgingCost;
  double miscellaneousCost;

  Budget(
      {this.sId,
        this.travelCost,
        this.foodCost,
        this.lodgingCost,
        this.miscellaneousCost});

  Budget.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    travelCost = double.parse(json['travelCost'].toString());
    foodCost = double.parse(json['foodCost'].toString());
    lodgingCost = double.parse(json['lodgingCost'].toString());
    miscellaneousCost = double.parse(json['miscellaneousCost'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['travelCost'] = this.travelCost;
    data['foodCost'] = this.foodCost;
    data['lodgingCost'] = this.lodgingCost;
    data['miscellaneousCost'] = this.miscellaneousCost;
    return data;
  }
}
class GetTripList {
  bool success;
  List<String> trips;
  String message;

  GetTripList({this.success, this.trips, this.message});

  GetTripList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    trips = json['trips'].cast<String>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['trips'] = this.trips;
    data['message'] = this.message;
    return data;
  }
}
// TODO: ADD IF BUDGET IS FIXED IN MONGODB

/*

class Budget {
  List<Budget> budget;

  Budget({this.budget});

  Budget.fromJson(Map<String, dynamic> json) {
    if (json['budget'] != null) {
      budget = new List<Budget>();
      json['budget'].forEach((v) {
        budget.add(new Budget.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.budget != null) {
      data['budget'] = this.budget.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Budget {
  String sId;
  double cost;
  String name;

  Budget({this.sId, this.cost, this.name});

  Budget.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cost = json['cost'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['cost'] = this.cost;
    data['name'] = this.name;
    return data;
  }
}*/
