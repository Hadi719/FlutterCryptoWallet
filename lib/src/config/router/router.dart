import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';

import '../../presentation/app/bloc/app_bloc.dart';
import '../../presentation/auth/auth.dart';
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
