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
