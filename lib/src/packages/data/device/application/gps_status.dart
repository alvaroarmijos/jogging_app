import 'package:geolocator/geolocator.dart';

class GpsStatus {
  const GpsStatus();

  Stream<bool> call() => Geolocator.getServiceStatusStream().map(
        (event) => event.index == 1 ? true : false,
      );
}
