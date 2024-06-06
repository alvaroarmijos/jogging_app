import 'package:permission_handler/permission_handler.dart';

class AskGpsPermissions {
  const AskGpsPermissions();

  Stream<bool> call() => Permission.location
      .request()
      .asStream()
      .map((status) => status.isGranted);
}
