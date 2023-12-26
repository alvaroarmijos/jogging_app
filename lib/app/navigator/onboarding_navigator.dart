import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/features/onboarding/onboarding.dart';

import '../di/injection_container.dart';
import 'app_navigator.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class OnboardingNavigator extends StatelessWidget {
  const OnboardingNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OnboardingBloc>(),
      child: WillPopScope(
        child: Navigator(
          key: navigatorKey,
          onGenerateRoute: _routeFactory,
        ),
        onWillPop: () async {
          return !(await navigatorKey.currentState?.maybePop() ?? true);
        },
      ),
    );
  }

  static Route<dynamic> _routeFactory(RouteSettings settings) {
    switch (settings.name) {
      case AppNavigator.ROUTE_MAIN_PAGE:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OnboardingPage(),
        );
      case AppNavigator.ROUTE_ONBOARDING_FLOW_INFORMATION_PAGE:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const InformationPage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                  'No route defined on Onboarding navigator for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
