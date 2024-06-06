import 'package:permission_handler/permission_handler.dart';

class CheckPermissions {
  const CheckPermissions();

  Stream<bool> call() => Permission.location.isGranted.asStream();
}
