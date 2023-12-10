import 'package:geolocator/geolocator.dart';

class GetCurrentPosition {
  const GetCurrentPosition();
  //: TODO retornar objeto de tipo LatLng
  Stream<Position> call() => Geolocator.getCurrentPosition().asStream();
}
