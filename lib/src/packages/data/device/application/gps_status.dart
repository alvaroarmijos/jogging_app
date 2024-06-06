import 'package:geolocator/geolocator.dart';

class GpsStatus {
  const GpsStatus();

  Stream<bool> call() => Geolocator.getServiceStatusStream()
      .map((status) => status == ServiceStatus.enabled);
}
