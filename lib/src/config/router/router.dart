import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';

import '../../presentation/app/bloc/app_bloc.dart';
import '../../presentation/auth/auth.dart';
import '../../presentation/profile/profile.dart';
import '../../service_locator.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      _setCurrentScreen(ProfilePage.screenName);
      return [ProfilePage.page()];
    case AppStatus.unauthenticated:
      _setCurrentScreen(AuthPage.screenName);
      return [AuthPage.page()];
  }
}

void _setCurrentScreen(String routeName) {
  serviceLocator<FirebaseAnalytics>().setCurrentScreen(
    screenName: routeName,
  );
}
