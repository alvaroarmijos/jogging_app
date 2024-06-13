import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:tracking_app/src/packages/data/routes/domain/directions/directions.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/api_dtos.dart';

class DirectionsMapper {
  const DirectionsMapper();

  Directions fromApiDto(DirectionsDto dto) {
    final distance = dto.routes?[0].distance ?? 0;
    final duration = dto.routes?[0].duration ?? 0;
    final geometry = dto.routes?[0].geometry ?? '';

    // Decodificacion
    final polylines = decodePolyline(geometry, accuracyExponent: 6);

    final points = polylines
        .map((coordenadas) =>
            LatLng(coordenadas[0].toDouble(), coordenadas[1].toDouble()))
        .toList();

    return Directions(
      distance: distance,
      duration: duration,
      points: points,
    );
  }
}
