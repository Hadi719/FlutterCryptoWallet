import 'package:bloc/bloc.dart' show Bloc;
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;

import 'src/presentation/app/app.dart';
import 'src/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Add bloc observer for dev debugging.
  Bloc.observer = const AppBlocObserver();

  // Setup GetIt service locator.
  await setup();

  runApp(const App());
}
