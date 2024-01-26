import 'package:geolocator/geolocator.dart';

class GpsPositionStream {
  const GpsPositionStream();

  Stream<Position> call() => Geolocator.getPositionStream();
}
