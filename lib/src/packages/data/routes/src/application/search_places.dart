import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/places/places.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/places/places_service.dart';

class SearchPlaces {
  SearchPlaces(this._placesService);

  final PlacesService _placesService;

  Stream<List<Feature>> call(LatLng proximity, String query) =>
      _placesService.searchPlaces(proximity, query);
}
