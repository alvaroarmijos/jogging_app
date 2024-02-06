import 'dart:ui';

import 'package:flutter/src/rendering/custom_paint.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

Future<BitmapDescriptor> getStartUberMarker(
    int minutes, String destination) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(350, 150);

  final startUberMarkerPainter = StartUberMarker(
    minutes: minutes,
    description: destination,
  );
  startUberMarkerPainter.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}

Future<BitmapDescriptor> getEndUberMarker(
    int kilometers, String description) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(350, 150);

  final startUberMarkerPainter = EndUberMarker(
    kilometers: kilometers,
    description: description,
  );
  startUberMarkerPainter.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}

Future<BitmapDescriptor> getCabifyMarker(String description, bool start) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(350, 150);

  late final CustomPainter cabifyMarker;

  if (start) {
    cabifyMarker = StartCabifyMarker(description: description);
  } else {
    cabifyMarker = EndCabifyMarker(description: description);
  }

  cabifyMarker.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}
