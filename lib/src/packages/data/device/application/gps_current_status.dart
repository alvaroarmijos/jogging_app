import 'package:geolocator/geolocator.dart';

class GpsCurrentStatus {
  const GpsCurrentStatus();

  Future<bool> call() => Geolocator.isLocationServiceEnabled();
}
