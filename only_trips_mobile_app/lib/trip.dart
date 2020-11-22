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

class Destination {
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
}

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
}
