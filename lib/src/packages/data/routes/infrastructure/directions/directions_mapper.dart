import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:tracking_app/src/packages/data/routes/domain/directions/directions.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/api_dtos.dart';

class DirectionsMapper {
  const DirectionsMapper();

  Directions fromApiDto(DirectionsDto dto) {
    final geometry = dto.routes[0].geometry;
    final distance = dto.routes[0].distance;
    final duration = dto.routes[0].duration;

    //Decodificacion
    final polylines = decodePolyline(geometry, accuracyExponent: 6);

    final points = polylines
        .map(
          (coordinates) =>
              LatLng(coordinates[0].toDouble(), coordinates[1].toDouble()),
        )
        .toList();

    return Directions(
      distance: distance,
      duration: duration,
      points: points,
    );
  }
}
