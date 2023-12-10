import 'dart:async';

import 'package:geolocator/geolocator.dart';

class GetPositionStream {
  const GetPositionStream();
  //: TODO retornar objeto de tipo LatLng
  Stream<Position> call() => Geolocator.getPositionStream();
}
