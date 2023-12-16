import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'development/app_bloc_observer.dart';
import 'src/coinex_app.dart';
import 'src/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup GetIt service locator.
  await setup();

  // Add bloc observer for dev debugging.
  Bloc.observer = const AppBlocObserver();

  runApp(CoinExApp());
}
