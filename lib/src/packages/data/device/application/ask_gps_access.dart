import 'package:permission_handler/permission_handler.dart';

class AskGpsAccess {
  const AskGpsAccess();

  Stream<bool> call() => Permission.location.request().asStream().map(
        (event) => event.isGranted,
      );
}
