import 'dart:ui';

import 'package:flutter/src/rendering/custom_paint.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

Future<BitmapDescriptor> getCustomMarker(String destination,
    {required bool start}) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(250, 150);

  late final CustomPainter markerPainter;

  if (start) {
    markerPainter = StartMarkerPainter(destination: destination);
  } else {
    markerPainter = EndMarkerPainter(destination: destination);
  }

  markerPainter.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}

Future<BitmapDescriptor> getStartCustomMarker(
    int minutes, String destination) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(350, 150);

  final startmarkerPainter =
      StartUberMarkerPainter(minutes: minutes, destination: destination);
  startmarkerPainter.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}

Future<BitmapDescriptor> getEndCustomMarker(
    int kilometers, String destination) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(350, 150);

  final startmarkerPainter =
      EndUberMarkerPainter(kilometers: kilometers, destination: destination);
  startmarkerPainter.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}
