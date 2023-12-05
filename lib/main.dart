import 'package:flutter/material.dart';
import 'package:tracking_app/src/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        title: 'Tracking App',
        home: const MapPage());
  }
}
