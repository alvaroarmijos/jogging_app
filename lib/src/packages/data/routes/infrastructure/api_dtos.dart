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

class PlacesDto {
  String? type;
  List<String>? query;
  List<FeatureDto>? features;
  String? attribution;

  PlacesDto({
    this.type,
    this.query,
    this.features,
    this.attribution,
  });

  factory PlacesDto.fromRawJson(String str) =>
      PlacesDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlacesDto.fromJson(Map<String, dynamic> json) => PlacesDto(
        type: json["type"],
        query: json["query"] == null
            ? []
            : List<String>.from(json["query"]!.map((x) => x)),
        features: json["features"] == null
            ? []
            : List<FeatureDto>.from(
                json["features"]!.map((x) => FeatureDto.fromJson(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "query": query == null ? [] : List<dynamic>.from(query!.map((x) => x)),
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
        "attribution": attribution,
      };
}

class FeatureDto {
  String? id;
  String? type;
  List<String>? placeType;
  int? relevance;
  PropertiesDto? properties;
  String? textEs;
  String? placeNameEs;
  String? text;
  String? placeName;
  List<double>? center;
  GeometryDto? geometry;
  List<ContextDto>? context;
  String? matchingText;
  String? matchingPlaceName;

  FeatureDto({
    this.id,
    this.type,
    this.placeType,
    this.relevance,
    this.properties,
    this.textEs,
    this.placeNameEs,
    this.text,
    this.placeName,
    this.center,
    this.geometry,
    this.context,
    this.matchingText,
    this.matchingPlaceName,
  });

  factory FeatureDto.fromRawJson(String str) =>
      FeatureDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeatureDto.fromJson(Map<String, dynamic> json) => FeatureDto(
        id: json["id"],
        type: json["type"],
        placeType: json["place_type"] == null
            ? []
            : List<String>.from(json["place_type"]!.map((x) => x)),
        relevance: json["relevance"],
        properties: json["properties"] == null
            ? null
            : PropertiesDto.fromJson(json["properties"]),
        textEs: json["text_es"],
        placeNameEs: json["place_name_es"],
        text: json["text"],
        placeName: json["place_name"],
        center: json["center"] == null
            ? []
            : List<double>.from(json["center"]!.map((x) => x?.toDouble())),
        geometry: json["geometry"] == null
            ? null
            : GeometryDto.fromJson(json["geometry"]),
        context: json["context"] == null
            ? []
            : List<ContextDto>.from(
                json["context"]!.map((x) => ContextDto.fromJson(x))),
        matchingText: json["matching_text"],
        matchingPlaceName: json["matching_place_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_type": placeType == null
            ? []
            : List<dynamic>.from(placeType!.map((x) => x)),
        "relevance": relevance,
        "properties": properties?.toJson(),
        "text_es": textEs,
        "place_name_es": placeNameEs,
        "text": text,
        "place_name": placeName,
        "center":
            center == null ? [] : List<dynamic>.from(center!.map((x) => x)),
        "geometry": geometry?.toJson(),
        "context": context == null
            ? []
            : List<dynamic>.from(context!.map((x) => x.toJson())),
        "matching_text": matchingText,
        "matching_place_name": matchingPlaceName,
      };
}

class ContextDto {
  String? id;
  String? mapboxId;
  String? textEs;
  String? text;
  String? wikidata;
  String? shortCode;

  ContextDto({
    this.id,
    this.mapboxId,
    this.textEs,
    this.text,
    this.wikidata,
    this.shortCode,
  });

  factory ContextDto.fromRawJson(String str) =>
      ContextDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContextDto.fromJson(Map<String, dynamic> json) => ContextDto(
        id: json["id"],
        mapboxId: json["mapbox_id"],
        textEs: json["text_es"],
        text: json["text"],
        wikidata: json["wikidata"],
        shortCode: json["short_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mapbox_id": mapboxId,
        "text_es": textEs,
        "text": text,
        "wikidata": wikidata,
        "short_code": shortCode,
      };
}

class GeometryDto {
  List<double>? coordinates;
  String? type;

  GeometryDto({
    this.coordinates,
    this.type,
  });

  factory GeometryDto.fromRawJson(String str) =>
      GeometryDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeometryDto.fromJson(Map<String, dynamic> json) => GeometryDto(
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
        "type": type,
      };
}

class PropertiesDto {
  String? foursquare;
  bool? landmark;
  String? address;
  String? category;
  String? wikidata;

  PropertiesDto({
    this.foursquare,
    this.landmark,
    this.address,
    this.category,
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
