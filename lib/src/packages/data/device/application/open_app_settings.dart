import 'package:permission_handler/permission_handler.dart';

class OpenAppSettings {
  const OpenAppSettings();

  Future<void> call() => openAppSettings();
}
