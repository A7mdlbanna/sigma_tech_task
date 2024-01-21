class Address {
  Address({
    this.address,
    this.city,
    this.coordinates,
    this.postalCode,
    this.state,});

  Address.fromJson(dynamic json) {
    address = json['address'];
    city = json['city'];
    coordinates = json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null;
    postalCode = json['postalCode'];
    state = json['state'];
  }
  String? address;
  String? city;
  Coordinates? coordinates;
  String? postalCode;
  String? state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['city'] = city;
    if (coordinates != null) {
      map['coordinates'] = coordinates?.toJson();
    }
    map['postalCode'] = postalCode;
    map['state'] = state;
    return map;
  }

}

class Coordinates {
  Coordinates({
    this.lat,
    this.lng,});

  Coordinates.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}
