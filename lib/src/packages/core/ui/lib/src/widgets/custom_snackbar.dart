import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {
  CustomSnackbar({
    Key? key,
    required String message,
    String label = 'Ok',
    Duration duration = const Duration(seconds: 2),
    VoidCallback? onPressed,
  }) : super(
          key: key,
          content: Text(message),
          duration: duration,
          action: SnackBarAction(
            label: label,
            onPressed: () => onPressed?.call(),
          ),
        );
}
