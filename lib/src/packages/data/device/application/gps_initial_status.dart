import 'package:geolocator/geolocator.dart';

class GpsInitialStatus {
  const GpsInitialStatus();

  Future<bool> call() => Geolocator.isLocationServiceEnabled();
}
