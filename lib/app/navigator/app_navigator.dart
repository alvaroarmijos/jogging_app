// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static const ROUTE_MAIN_PAGE = Navigator.defaultRouteName;
  static const ROUTE_ONBOARDING_FLOW_INFORMATION_PAGE = '/user_information';

  static void navigateToInformationPage(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_ONBOARDING_FLOW_INFORMATION_PAGE);
  }
}
