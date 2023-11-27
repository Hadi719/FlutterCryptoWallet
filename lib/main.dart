import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'development/firebase/firebase_example.dart';
import 'src/service_locator.dart';

// late final FirebaseApp app;
// late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391

  // We store the app and auth to make testing with a named instance easier.
  // app = await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // auth = FirebaseAuth.instanceFor(app: app);

  // Setup GetIt service locator.
  await setup();

  runApp(AuthExampleApp(auth: serviceLocator<FirebaseAuth>()));
}
