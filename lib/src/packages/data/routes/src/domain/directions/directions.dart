import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  Directions({
    required this.points,
    required this.duration,
    required this.distance,
  });

  final List<LatLng> points;
  final double duration;
  final double distance;
}
