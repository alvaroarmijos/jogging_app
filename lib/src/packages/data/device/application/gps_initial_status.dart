import 'package:geolocator/geolocator.dart';

class GpsInitialStatus {
  const GpsInitialStatus();

  Stream<bool> call() => Geolocator.isLocationServiceEnabled().asStream();
}
