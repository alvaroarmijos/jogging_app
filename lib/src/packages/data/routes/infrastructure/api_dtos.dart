import 'dart:convert';

class DirectionsDto {
  List<RouteDto>? routes;
  List<WaypointDto>? waypoints;
  String? code;
  String? uuid;

  DirectionsDto({
    this.routes,
    this.waypoints,
    this.code,
    this.uuid,
  });

  factory DirectionsDto.fromRawJson(String str) =>
      DirectionsDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DirectionsDto.fromJson(Map<String, dynamic> json) => DirectionsDto(
        routes: json["routes"] == null
            ? []
            : List<RouteDto>.from(
                json["routes"]!.map((x) => RouteDto.fromJson(x))),
        waypoints: json["waypoints"] == null
            ? []
            : List<WaypointDto>.from(
                json["waypoints"]!.map((x) => WaypointDto.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "routes": routes == null
            ? []
            : List<dynamic>.from(routes!.map((x) => x.toJson())),
        "waypoints": waypoints == null
            ? []
            : List<dynamic>.from(waypoints!.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
      };
}

class RouteDto {
  String? weightName;
  double? weight;
  double? duration;
  double? distance;
  List<LegDto>? legs;
  String? geometry;

  RouteDto({
    this.weightName,
    this.weight,
    this.duration,
    this.distance,
    this.legs,
    this.geometry,
  });

  factory RouteDto.fromRawJson(String str) =>
      RouteDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RouteDto.fromJson(Map<String, dynamic> json) => RouteDto(
        weightName: json["weight_name"],
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        legs: json["legs"] == null
            ? []
            : List<LegDto>.from(json["legs"]!.map((x) => LegDto.fromJson(x))),
        geometry: json["geometry"],
      );

  Map<String, dynamic> toJson() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": legs == null
            ? []
            : List<dynamic>.from(legs!.map((x) => x.toJson())),
        "geometry": geometry,
      };
}

class LegDto {
  List<dynamic>? viaWaypoints;
  List<AdminDto>? admins;
  double? weight;
  double? duration;
  List<dynamic>? steps;
  double? distance;
  String? summary;

  LegDto({
    this.viaWaypoints,
    this.admins,
    this.weight,
    this.duration,
    this.steps,
    this.distance,
    this.summary,
  });

  factory LegDto.fromRawJson(String str) => LegDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LegDto.fromJson(Map<String, dynamic> json) => LegDto(
        viaWaypoints: json["via_waypoints"] == null
            ? []
            : List<dynamic>.from(json["via_waypoints"]!.map((x) => x)),
        admins: json["admins"] == null
            ? []
            : List<AdminDto>.from(
                json["admins"]!.map((x) => AdminDto.fromJson(x))),
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        steps: json["steps"] == null
            ? []
            : List<dynamic>.from(json["steps"]!.map((x) => x)),
        distance: json["distance"]?.toDouble(),
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "via_waypoints": viaWaypoints == null
            ? []
            : List<dynamic>.from(viaWaypoints!.map((x) => x)),
        "admins": admins == null
            ? []
            : List<dynamic>.from(admins!.map((x) => x.toJson())),
        "weight": weight,
        "duration": duration,
        "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x)),
        "distance": distance,
        "summary": summary,
      };
}

class AdminDto {
  String? iso31661Alpha3;
  String? iso31661;

  AdminDto({
    this.iso31661Alpha3,
    this.iso31661,
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
  double? distance;
  String? name;
  List<double>? location;

  WaypointDto({
    this.distance,
    this.name,
    this.location,
  });

  factory WaypointDto.fromRawJson(String str) =>
      WaypointDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WaypointDto.fromJson(Map<String, dynamic> json) => WaypointDto(
        distance: json["distance"]?.toDouble(),
        name: json["name"],
        location: json["location"] == null
            ? []
            : List<double>.from(json["location"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "distance": distance,
        "name": name,
        "location":
            location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
      };
}
