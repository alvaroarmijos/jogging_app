import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

Future<BitmapDescriptor> getAssetImageMarker() async {
  return BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(),
    TrackingDrawables.getLocationPinDrawable(),
  );
}
