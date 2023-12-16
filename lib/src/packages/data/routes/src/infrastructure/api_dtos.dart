import 'dart:convert';

/// Traffic
class TrafficDto {
  final List<RouteDto> routes;
  final List<WaypointDto> waypoints;
  final String code;
  final String uuid;

  TrafficDto({
    required this.routes,
    required this.waypoints,
    required this.code,
    required this.uuid,
  });

  factory TrafficDto.fromJson(String str) =>
      TrafficDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TrafficDto.fromMap(Map<String, dynamic> json) => TrafficDto(
        routes:
            List<RouteDto>.from(json["routes"].map((x) => RouteDto.fromMap(x))),
        waypoints: List<WaypointDto>.from(
            json["waypoints"].map((x) => WaypointDto.fromMap(x))),
        code: json["code"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toMap() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toMap())),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toMap())),
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

  factory RouteDto.fromJson(String str) => RouteDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RouteDto.fromMap(Map<String, dynamic> json) => RouteDto(
        weightName: json["weight_name"],
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        legs: List<LegDto>.from(json["legs"].map((x) => LegDto.fromMap(x))),
        geometry: json["geometry"],
      );

  Map<String, dynamic> toMap() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": List<dynamic>.from(legs.map((x) => x.toMap())),
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

  factory LegDto.fromJson(String str) => LegDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LegDto.fromMap(Map<String, dynamic> json) => LegDto(
        viaWaypoints: List<dynamic>.from(json["via_waypoints"].map((x) => x)),
        admins:
            List<AdminDto>.from(json["admins"].map((x) => AdminDto.fromMap(x))),
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        steps: List<dynamic>.from(json["steps"].map((x) => x)),
        distance: json["distance"]?.toDouble(),
        summary: json["summary"],
      );

  Map<String, dynamic> toMap() => {
        "via_waypoints": List<dynamic>.from(viaWaypoints.map((x) => x)),
        "admins": List<dynamic>.from(admins.map((x) => x.toMap())),
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

  factory AdminDto.fromJson(String str) => AdminDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdminDto.fromMap(Map<String, dynamic> json) => AdminDto(
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661: json["iso_3166_1"],
      );

  Map<String, dynamic> toMap() => {
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

  factory WaypointDto.fromJson(String str) =>
      WaypointDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WaypointDto.fromMap(Map<String, dynamic> json) => WaypointDto(
        distance: json["distance"]?.toDouble(),
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
      };
}

class PlacesDto {
  final String type;
  final List<FeatureDto> features;
  final String attribution;

  PlacesDto({
    required this.type,
    required this.features,
    required this.attribution,
  });

  factory PlacesDto.fromJson(String str) => PlacesDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlacesDto.fromMap(Map<String, dynamic> json) => PlacesDto(
        type: json["type"],
        features: List<FeatureDto>.from(
            json["features"].map((x) => FeatureDto.fromMap(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "features": List<dynamic>.from(features.map((x) => x.toMap())),
        "attribution": attribution,
      };
}

class FeatureDto {
  final String id;
  final String type;
  final List<String> placeType;
  final PropertiesDto properties;
  final String textEs;
  final String placeNameEs;
  final String text;
  final String placeName;
  final List<double> center;
  final GeometryDto geometry;
  final List<ContextDto> context;
  final String? languageEs;
  final String? language;

  FeatureDto({
    required this.id,
    required this.type,
    required this.placeType,
    required this.properties,
    required this.textEs,
    required this.placeNameEs,
    required this.text,
    required this.placeName,
    required this.center,
    required this.geometry,
    required this.context,
    this.languageEs,
    this.language,
  });

  factory FeatureDto.fromJson(String str) =>
      FeatureDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeatureDto.fromMap(Map<String, dynamic> json) => FeatureDto(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        properties: PropertiesDto.fromMap(json["properties"]),
        textEs: json["text_es"],
        placeNameEs: json["place_name_es"],
        text: json["text"],
        placeName: json["place_name"],
        center: List<double>.from(json["center"].map((x) => x?.toDouble())),
        geometry: GeometryDto.fromMap(json["geometry"]),
        context: List<ContextDto>.from(
            json["context"].map((x) => ContextDto.fromMap(x))),
        languageEs: json["language_es"],
        language: json["language"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "properties": properties.toMap(),
        "text_es": textEs,
        "place_name_es": placeNameEs,
        "text": text,
        "place_name": placeName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toMap(),
        "context": List<dynamic>.from(context.map((x) => x.toMap())),
        "language_es": languageEs,
        "language": language,
      };
}

/// Routes
class ContextDto {
  final String id;
  final String textEs;
  final String text;
  final String? wikidata;
  final String? languageEs;
  final String? language;
  final String? shortCode;

  ContextDto({
    required this.id,
    required this.textEs,
    required this.text,
    this.wikidata,
    this.languageEs,
    this.language,
    this.shortCode,
  });

  factory ContextDto.fromJson(String str) =>
      ContextDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContextDto.fromMap(Map<String, dynamic> json) => ContextDto(
        id: json["id"],
        textEs: json["text_es"],
        text: json["text"],
        wikidata: json["wikidata"],
        languageEs: json["language_es"],
        language: json["language"],
        shortCode: json["short_code"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "text_es": textEs,
        "text": text,
        "wikidata": wikidata,
        "language_es": languageEs,
        "language": language,
        "short_code": shortCode,
      };
}

class GeometryDto {
  final List<double> coordinates;
  final String type;

  GeometryDto({
    required this.coordinates,
    required this.type,
  });

  factory GeometryDto.fromJson(String str) =>
      GeometryDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GeometryDto.fromMap(Map<String, dynamic> json) => GeometryDto(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}

class PropertiesDto {
  final String? foursquare;
  final bool? landmark;
  final String? address;
  final String? category;
  final String? wikidata;

  PropertiesDto({
    this.foursquare,
    this.landmark,
    this.address,
    this.category,
    this.wikidata,
  });

  factory PropertiesDto.fromJson(String str) =>
      PropertiesDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PropertiesDto.fromMap(Map<String, dynamic> json) => PropertiesDto(
        foursquare: json["foursquare"],
        landmark: json["landmark"],
        address: json["address"],
        category: json["category"],
        wikidata: json["wikidata"],
      );

  Map<String, dynamic> toMap() => {
        "foursquare": foursquare,
        "landmark": landmark,
        "address": address,
        "category": category,
        "wikidata": wikidata,
      };
}
