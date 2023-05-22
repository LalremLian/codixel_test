class Coordinates {
  Coordinates({
      this.lat, 
      this.lng,});

  Coordinates.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  double? lat;
  double? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}