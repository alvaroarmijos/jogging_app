import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

void showLoadingMessage(BuildContext context) {
  showAdaptiveDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return const AlertDialog.adaptive(
        title: Text("Espere por favor"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Calculando ruta"),
            SizedBox(height: TrackingDimens.dimen_8),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      );
    },
  );
}
