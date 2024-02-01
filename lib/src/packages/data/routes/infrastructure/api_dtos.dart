import 'dart:convert';

class DirectionsDto {
  final List<RouteDto> routes;
  final List<WaypointDto> waypoints;
  final String code;
  final String uuid;

  DirectionsDto({
    required this.routes,
    required this.waypoints,
    required this.code,
    required this.uuid,
  });

  factory DirectionsDto.fromRawJson(String str) =>
      DirectionsDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DirectionsDto.fromJson(Map<String, dynamic> json) => DirectionsDto(
        routes: List<RouteDto>.from(
            json["routes"].map((x) => RouteDto.fromJson(x))),
        waypoints: List<WaypointDto>.from(
            json["waypoints"].map((x) => WaypointDto.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
      };
}

class RouteDto {
  final String weightName;
  final double weight;
  final double duration;
  final double distance;
  final List<LegDto> legs;
  final String geometry;

  RouteDto({
    required this.weightName,
    required this.weight,
    required this.duration,
    required this.distance,
    required this.legs,
    required this.geometry,
  });

  factory RouteDto.fromRawJson(String str) =>
      RouteDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RouteDto.fromJson(Map<String, dynamic> json) => RouteDto(
        weightName: json["weight_name"],
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        legs: List<LegDto>.from(json["legs"].map((x) => LegDto.fromJson(x))),
        geometry: json["geometry"],
      );

  Map<String, dynamic> toJson() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "geometry": geometry,
      };
}

class LegDto {
  final List<dynamic> viaWaypoints;
  final List<AdminDto> admins;
  final double weight;
  final double duration;
  final List<dynamic> steps;
  final double distance;
  final String summary;

  LegDto({
    required this.viaWaypoints,
    required this.admins,
    required this.weight,
    required this.duration,
    required this.steps,
    required this.distance,
    required this.summary,
  });

  factory LegDto.fromRawJson(String str) => LegDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LegDto.fromJson(Map<String, dynamic> json) => LegDto(
        viaWaypoints: List<dynamic>.from(json["via_waypoints"].map((x) => x)),
        admins: List<AdminDto>.from(
            json["admins"].map((x) => AdminDto.fromJson(x))),
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        steps: List<dynamic>.from(json["steps"].map((x) => x)),
        distance: json["distance"]?.toDouble(),
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "via_waypoints": List<dynamic>.from(viaWaypoints.map((x) => x)),
        "admins": List<dynamic>.from(admins.map((x) => x.toJson())),
        "weight": weight,
        "duration": duration,
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "distance": distance,
        "summary": summary,
      };
}

class AdminDto {
  final String iso31661Alpha3;
  final String iso31661;

  AdminDto({
    required this.iso31661Alpha3,
    required this.iso31661,
  });

  factory AdminDto.fromRawJson(String str) =>
      AdminDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdminDto.fromJson(Map<String, dynamic> json) => AdminDto(
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661: json["iso_3166_1"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1_alpha3": iso31661Alpha3,
        "iso_3166_1": iso31661,
      };
}

class WaypointDto {
  final double distance;
  final String name;
  final List<double> location;

  WaypointDto({
    required this.distance,
    required this.name,
    required this.location,
  });

  factory WaypointDto.fromRawJson(String str) =>
      WaypointDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WaypointDto.fromJson(Map<String, dynamic> json) => WaypointDto(
        distance: json["distance"]?.toDouble(),
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
      };
}

// Places
class PlacesDto {
  final String type;
  final List<String> query;
  final List<FeatureDto> features;
  final String attribution;

  PlacesDto({
    required this.type,
    required this.query,
    required this.features,
    required this.attribution,
  });

  factory PlacesDto.fromRawJson(String str) =>
      PlacesDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlacesDto.fromJson(Map<String, dynamic> json) => PlacesDto(
        type: json["type"],
        query: List<String>.from(json["query"].map((x) => x)),
        features: List<FeatureDto>.from(
            json["features"].map((x) => FeatureDto.fromJson(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution,
      };
}

class FeatureDto {
  final String id;
  final String type;
  final List<String> placeType;
  final int relevance;
  final PropertiesDto properties;
  final String textEs;
  final String placeNameEs;
  final String text;
  final String placeName;
  final List<double> center;
  final GeometryDto geometry;

  FeatureDto({
    required this.id,
    required this.type,
    required this.placeType,
    required this.relevance,
    required this.properties,
    required this.textEs,
    required this.placeNameEs,
    required this.text,
    required this.placeName,
    required this.center,
    required this.geometry,
  });

  factory FeatureDto.fromRawJson(String str) =>
      FeatureDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeatureDto.fromJson(Map<String, dynamic> json) => FeatureDto(
        id: json["id"] ?? "",
        type: json["type"] ?? "",
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        relevance: json["relevance"],
        properties: PropertiesDto.fromJson(json["properties"]),
        textEs: json["text_es"],
        placeNameEs: json["place_name_es"],
        text: json["text"],
        placeName: json["place_name"],
        center: List<double>.from(json["center"].map((x) => x?.toDouble())),
        geometry: GeometryDto.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "relevance": relevance,
        "properties": properties.toJson(),
        "text_es": textEs,
        "place_name_es": placeNameEs,
        "text": text,
        "place_name": placeName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toJson(),
      };
}

class GeometryDto {
  final List<double> coordinates;
  final String type;

  GeometryDto({
    required this.coordinates,
    required this.type,
  });

  factory GeometryDto.fromRawJson(String str) =>
      GeometryDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeometryDto.fromJson(Map<String, dynamic> json) => GeometryDto(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}

class PropertiesDto {
  final String foursquare;
  final bool landmark;
  final String? address;
  final String category;
  final String? wikidata;

  PropertiesDto({
    required this.foursquare,
    required this.landmark,
    this.address,
    required this.category,
    this.wikidata,
  });

  factory PropertiesDto.fromRawJson(String str) =>
      PropertiesDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PropertiesDto.fromJson(Map<String, dynamic> json) => PropertiesDto(
        foursquare: json["foursquare"],
        landmark: json["landmark"],
        address: json["address"],
        category: json["category"],
        wikidata: json["wikidata"],
      );

  Map<String, dynamic> toJson() => {
        "foursquare": foursquare,
        "landmark": landmark,
        "address": address,
        "category": category,
        "wikidata": wikidata,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
