class Place {
  final String id;
  final String type;
  final List<String> placeType;
  final Properties properties;
  final String textEs;
  final String placeNameEs;
  final String text;
  final String placeName;
  final List<double> center;
  final Geometry geometry;
  final List<Context> context;
  final String? languageEs;
  final String? language;

  Place({
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
}

class Context {
  final String id;
  final String textEs;
  final String text;
  final String? wikidata;
  final String? languageEs;
  final String? language;
  final String? shortCode;

  Context({
    required this.id,
    required this.textEs,
    required this.text,
    this.wikidata,
    this.languageEs,
    this.language,
    this.shortCode,
  });
}

class Geometry {
  final List<double> coordinates;
  final String type;

  Geometry({
    required this.coordinates,
    required this.type,
  });
}

class Properties {
  final String? foursquare;
  final bool? landmark;
  final String? address;
  final String? category;
  final String? wikidata;

  Properties({
    this.foursquare,
    this.landmark,
    this.address,
    this.category,
    this.wikidata,
  });
}
