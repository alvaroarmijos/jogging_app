import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/traffic/traffic.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/api_dtos.dart';

class TrafficMapper {
  const TrafficMapper();

  Traffic fromApiDto(TrafficDto apiDto) {
    final geometry = apiDto.routes[0].geometry;
    final distance = apiDto.routes[0].distance;
    final duration = apiDto.routes[0].duration;

    //Decode
    final polylines = decodePolyline(geometry, accuracyExponent: 6);

    final points = polylines
        .map(
          (coordinates) =>
              LatLng(coordinates[0].toDouble(), coordinates[1].toDouble()),
        )
        .toList();

    return Traffic(
      points: points,
      duration: duration,
      distance: distance,
    );
  }
}
