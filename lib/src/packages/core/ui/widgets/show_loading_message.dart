import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/dimens.dart';

void showLoadingMessage(BuildContext context) {
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return const AlertDialog.adaptive(
        title: Text('Espere por favor'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Calculando ruta'),
            SizedBox(
              height: AppDimens.dimen_8,
            ),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      );
    },
  );
}
