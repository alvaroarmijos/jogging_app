import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/places/place.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/places/places_service.dart';

class GetPlace {
  GetPlace(this._placesService);

  final PlacesService _placesService;

  Stream<Place> call(LatLng point) => _placesService.getPlaceByPoint(point);
}
