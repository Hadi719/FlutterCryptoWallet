import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../src/presentation/app/app.dart';
import '../src/service_locator.dart';
import 'dev_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Add bloc observer for dev debugging.
  Bloc.observer = const AppBlocObserver();

  // Setup GetIt service locator.
  await setup();

  runApp(const DevApp());
}
