import 'package:permission_handler/permission_handler.dart';

class CheckPermissionGranted {
  const CheckPermissionGranted();

  Stream<bool> call() => Permission.location.isGranted.asStream();
}
