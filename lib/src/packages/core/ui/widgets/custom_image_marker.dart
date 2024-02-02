import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

Future<BitmapDescriptor> getAssetImageMarker() async {
  return BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(),
    TrackingDrawables.getLocationPinDrawable(),
  );
}

Future<BitmapDescriptor> getnetworkImageMarker() async {
  final res = await Dio().get(
    'https://www.iconsdb.com/icons/preview/purple/marker-xxl.png',
    options: Options(
      responseType: ResponseType.bytes,
    ),
  );

  // Resize image
  final imageCodec = await instantiateImageCodec(res.data, targetHeight: 150);
  final frame = await imageCodec.getNextFrame();
  final data = await frame.image.toByteData(
    format: ImageByteFormat.png,
  );

  if (data == null) {
    return await getAssetImageMarker();
  }

  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
}
