import 'Coordinates.dart';

class Address {
  Address({
      this.city, 
      this.streetName, 
      this.streetAddress, 
      this.zipCode, 
      this.state, 
      this.country, 
      this.coordinates,});

  Address.fromJson(dynamic json) {
    city = json['city'];
    streetName = json['street_name'];
    streetAddress = json['street_address'];
    zipCode = json['zip_code'];
    state = json['state'];
    country = json['country'];
    coordinates = (json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null)!;
  }
  String? city;
  String? streetName;
  String? streetAddress;
  String? zipCode;
  String? state;
  String? country;
  Coordinates? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['street_name'] = streetName;
    map['street_address'] = streetAddress;
    map['zip_code'] = zipCode;
    map['state'] = state;
    map['country'] = country;
    final coordinates = this.coordinates;
    if (coordinates != null) {
      map['coordinates'] = coordinates.toJson();
    }
    return map;
  }

}