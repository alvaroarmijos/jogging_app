import 'package:geolocator/geolocator.dart';

class GetInitialPosition {
  const GetInitialPosition();

  Stream<Position> call() => Geolocator.getCurrentPosition().asStream();
}
