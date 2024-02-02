import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../domain/places/places_service.dart';
import '../routes.dart';

class GetPlace {
  GetPlace(this._placesService);

  final PlacesService _placesService;

  Stream<Place> call(LatLng point) => _placesService.getPlaceByPoint(point);
}
