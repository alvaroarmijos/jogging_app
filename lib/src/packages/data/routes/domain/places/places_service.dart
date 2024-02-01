import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'places.dart';

abstract class PlacesService {
  Stream<List<Place>> searchPlaces(LatLng proximity, String query);
}
