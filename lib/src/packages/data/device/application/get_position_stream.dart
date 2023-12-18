import 'dart:async';

import 'package:geolocator/geolocator.dart';

class GetPositionStream {
  const GetPositionStream();
  Stream<Position> call() => Geolocator.getPositionStream();
}
