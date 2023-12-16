import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class SearchResult {
  SearchResult({
    required this.cancel,
    this.manual = false,
    this.position,
    this.name,
    this.description,
  });

  final bool cancel;
  final bool manual;
  final LatLng? position;
  final String? name;
  final String? description;
}
