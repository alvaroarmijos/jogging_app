import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/places/places.dart';

abstract class PlacesService {
  Stream<List<Feature>> searchPlaces(LatLng proximity, String query);
}
