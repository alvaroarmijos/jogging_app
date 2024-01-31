import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  final double distance;
  final double duration;
  final List<LatLng> points;

  Directions({
    required this.distance,
    required this.duration,
    required this.points,
  });
}
