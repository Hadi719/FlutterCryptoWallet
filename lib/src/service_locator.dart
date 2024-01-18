import 'package:authentication_repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'config/firebase/firebase_options.dart';
import 'data/datasource/remote/coinex_remote_datasource.dart';
import 'data/repositories/coinex_datasource_repository_impl.dart';
import 'domain/repositories/coinex_api_repository.dart';

final GetIt serviceLocator = GetIt.instance;

/// Setups GetIt service locator.
Future<void> setup() async {
  _setupCoinExApi();

  await _setupFirebase();

  await _setupAuthenticationRepository();
}

void _setupCoinExApi() {
  final Dio dio = Dio();
  serviceLocator.registerSingleton<Dio>(dio);

  serviceLocator.registerSingleton<CoinExRemoteDataSource>(
    CoinExRemoteDataSource(
      serviceLocator<Dio>(),
    ),
  );

  serviceLocator.registerSingleton<CoinExApiRepository>(
    CoinExDataSourceRepositoryImpl(
      serviceLocator<CoinExRemoteDataSource>(),
    ),
  );
}

Future<void> _setupFirebase() async {
  // Initialize Firebase App
  final FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  serviceLocator.registerSingleton<FirebaseApp>(firebaseApp);

  serviceLocator.registerSingleton<FirebaseAuth>(
    FirebaseAuth.instanceFor(
      app: serviceLocator<FirebaseApp>(),
    ),
  );

  // Add Firebase Analytics
  serviceLocator.registerSingleton<FirebaseAnalytics>(
    FirebaseAnalytics.instanceFor(
      app: serviceLocator<FirebaseApp>(),
    ),
  );
}

Future<void> _setupAuthenticationRepository() async {
  serviceLocator.registerSingleton<AuthenticationRepository>(
    AuthenticationRepository(
      firebaseAuth: serviceLocator<FirebaseAuth>(),
    ),
  );
  await serviceLocator<AuthenticationRepository>().user.first;
}
