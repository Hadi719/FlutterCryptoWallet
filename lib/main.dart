import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'development/firebase/firebase_example.dart';
import 'src/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup GetIt service locator.
  await setup();

  runApp(AuthExampleApp(auth: serviceLocator<FirebaseAuth>()));
}
