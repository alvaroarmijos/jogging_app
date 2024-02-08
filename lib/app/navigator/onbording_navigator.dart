import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/app/di/injection_container.dart';
import 'package:tracking_app/app/navigator/app_navigator.dart';
import 'package:tracking_app/src/packages/features/onboarding/bloc/bloc/onboarding_bloc.dart';
import 'package:tracking_app/src/packages/features/onboarding/pages/information_page.dart';
import 'package:tracking_app/src/packages/features/onboarding/pages/onboarding_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class OnboardingNavigator extends StatelessWidget {
  const OnboardingNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OnboardingBloc>(),
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: _routeFactory,
      ),
    );
  }

  Route<dynamic> _routeFactory(RouteSettings settings) {
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
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No route defined on Onboarding navigator '),
            ),
          ),
        );
    }
  }
}
