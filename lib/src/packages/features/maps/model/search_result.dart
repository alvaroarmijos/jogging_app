import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchResult {
  final bool manual;
  final bool cancel;
  final LatLng? position;
  final String? name;
  final String? description;

  SearchResult({
    required this.manual,
    this.cancel = false,
    this.position,
    this.name,
    this.description,
  });
}
