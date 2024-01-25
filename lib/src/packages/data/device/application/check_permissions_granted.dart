import 'package:permission_handler/permission_handler.dart';

class CheckPermissionsGranted {
  const CheckPermissionsGranted();

  Stream<bool> call() => Permission.location.isGranted.asStream();
}
