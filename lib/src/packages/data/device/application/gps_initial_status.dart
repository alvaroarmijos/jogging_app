import 'package:geolocator/geolocator.dart';

class GpsInitialStatus {
  const GpsInitialStatus();

  Stream<bool> call() => Geolocator.getServiceStatusStream().map(
        (event) => event.index == 1 ? true : false,
      );
}
