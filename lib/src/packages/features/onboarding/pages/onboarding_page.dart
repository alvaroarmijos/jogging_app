import 'package:flutter/material.dart';
import 'package:tracking_app/app/navigator/app_navigator.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(TrackingDimens.dimen_20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Tener buena salud',
              style: textTheme.titleLarge,
            ),
            Image.asset(TrackingDrawables.getIconApp()),
            Text(
              'Estar sano lo es todo, no tener salud no es nada.\nEntonces, ¿por qué no?',
              style: textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () => AppNavigator.navigateToInformationPage(context),
              child: const Text('Empezar'),
            ),
          ],
        ),
      ),
    );
  }
}
