import 'package:flutter/widgets.dart';

import '../../presentation/app/bloc/app_bloc.dart';
import '../../presentation/auth/auth.dart';
import '../../presentation/profile/profile.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [ProfilePage.page()];
    case AppStatus.unauthenticated:
      return [AuthPage.page()];
  }
}
