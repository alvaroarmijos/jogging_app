import 'package:flutter/material.dart';
import 'package:tracking_app/src/pages/pages.dart';
import 'package:tracking_app/src/ui/ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TrackingThemes.light,
      title: 'Tracking App',
      home: const GpsPage(),
    );
  }
}
