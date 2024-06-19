import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/markers/end_cabify_marker.dart';
import 'package:tracking_app/src/packages/core/ui/markers/end_uber_marker.dart';
import 'package:tracking_app/src/packages/core/ui/markers/start_cabify_marker.dart';
import 'package:tracking_app/src/packages/core/ui/markers/start_uber_marker.dart';

Future<BitmapDescriptor> getStartUberMarker(int minutes, String place) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(350, 150);

  final startUberMarker = StartUberMarker(
    minutes: minutes,
    place: place,
  );

  startUberMarker.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(
    format: ImageByteFormat.png,
  );

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}

Future<BitmapDescriptor> getEndUberMarker(int kilometers, String place) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(350, 150);

  final endUberMarker = EndUberMarker(
    kilometers: kilometers,
    place: place,
  );

  endUberMarker.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(
    format: ImageByteFormat.png,
  );

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}

Future<BitmapDescriptor> getCabifyMarker(
    bool isStartMarker, String place) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(350, 150);

  late CustomPainter cabifyMarker;

  if (isStartMarker) {
    cabifyMarker = StartCabifyMarker(
      place: place,
    );
  } else {
    cabifyMarker = EndCabifyMarker(
      place: place,
    );
  }

  cabifyMarker.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(
    format: ImageByteFormat.png,
  );

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}
