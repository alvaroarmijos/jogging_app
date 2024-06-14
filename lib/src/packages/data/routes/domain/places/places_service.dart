import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/domain/places/places.dart';

abstract class PlacesService {
  Stream<List<Place>> searchPlaces(LatLng proximity, String query);
}
