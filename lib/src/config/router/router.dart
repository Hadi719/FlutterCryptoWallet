import 'package:firebase_analytics/firebase_analytics.dart'
    show FirebaseAnalytics;
import 'package:flutter/widgets.dart' show Page;

import '../../presentation/app/bloc/app_bloc.dart' show AppStatus;
import '../../presentation/auth/auth.dart' show AuthPage;
import '../../presentation/home/home.dart';
import '../../service_locator.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      _logScreenView(HomePage.screenName);
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      _logScreenView(AuthPage.screenName);
      return [AuthPage.page()];
  }
}

void _logScreenView(String screenName) {
  serviceLocator<FirebaseAnalytics>().logScreenView(
    screenName: screenName,
  );
}
