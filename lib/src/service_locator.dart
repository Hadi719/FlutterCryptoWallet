import 'dart:ui' show PlatformDispatcher;

import 'package:authentication_repository/authentication_repository.dart'
    show AuthenticationRepository;
import 'package:dio/dio.dart' show Dio;
import 'package:firebase_analytics/firebase_analytics.dart'
    show FirebaseAnalytics;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_core/firebase_core.dart' show Firebase, FirebaseApp;
import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    show FirebaseCrashlytics;
import 'package:firebase_storage/firebase_storage.dart' show FirebaseStorage;
import 'package:flutter/material.dart' show FlutterError;
import 'package:get_it/get_it.dart' show GetIt;

import 'config/firebase/firebase_options.dart';
import 'data/datasource/firebase/firebase_storage_client.dart';
import 'data/datasource/remote/coincap_remote_client.dart';
import 'data/datasource/remote/coinex_remote_client.dart';
import 'data/datasource/remote/coingecko_remote_client.dart';
import 'data/repositories/coincap_datasource_repository_impl.dart';
import 'data/repositories/coinex_datasource_repository_impl.dart';
import 'data/repositories/coingecko_datasource_repository_impl.dart';
import 'data/repositories/firebase_storage_datasource_repository_impl.dart';
import 'domain/repositories/coincap_api_repository.dart';
import 'domain/repositories/coinex_api_repository.dart';
import 'domain/repositories/coingecko_api_repository.dart';
import 'domain/repositories/firebase_storage_api_repository.dart';

final GetIt serviceLocator = GetIt.instance;

/// Setups GetIt service locator.
Future<void> setup() async {
  _setupDio();

  _setupCoinExApi();

  _setupCoinCapApi();

  _setupCoinGeckoApi();

  await _setupFirebase();

  await _setupAuthenticationRepository();
}

Future<void> _setupAuthenticationRepository() async {
  serviceLocator.registerSingleton<AuthenticationRepository>(
    AuthenticationRepository(
      firebaseAuth: serviceLocator<FirebaseAuth>(),
    ),
  );
  await serviceLocator<AuthenticationRepository>().user.first;
}

void _setupCoinCapApi() {
  serviceLocator.registerSingleton<CoinCapRemoteClient>(
    CoinCapRemoteClient(
      serviceLocator<Dio>(),
    ),
  );

  serviceLocator.registerSingleton<CoinCapApiRepository>(
    CoinCapDataSourceRepositoryImpl(
      serviceLocator<CoinCapRemoteClient>(),
    ),
  );
}

void _setupCoinExApi() {
  serviceLocator.registerSingleton<CoinExRemoteClient>(
    CoinExRemoteClient(
      serviceLocator<Dio>(),
    ),
  );

  serviceLocator.registerSingleton<CoinExApiRepository>(
    CoinExDataSourceRepositoryImpl(
      serviceLocator<CoinExRemoteClient>(),
    ),
  );
}

void _setupCoinGeckoApi() {
  serviceLocator.registerSingleton<CoinGeckoRemoteClient>(
    CoinGeckoRemoteClient(
      serviceLocator<Dio>(),
    ),
  );

  serviceLocator.registerSingleton<CoinGeckoApiRepository>(
    CoinGeckoDataSourceRepositoryImpl(
      serviceLocator<CoinGeckoRemoteClient>(),
    ),
  );
}

void _setupDio() {
  final Dio dio = Dio();
  serviceLocator.registerSingleton<Dio>(dio);
}

Future<void> _setupFirebase() async {
  /// Initialize Firebase App
  final FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  serviceLocator.registerSingleton<FirebaseApp>(firebaseApp);

  /// Initialize Firebase Analytics
  serviceLocator.registerSingleton<FirebaseAnalytics>(
    FirebaseAnalytics.instanceFor(app: firebaseApp),
  );

  /// Initialize Firebase Crashlytics
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  /// Initialize Firebase Auth
  serviceLocator.registerSingleton<FirebaseAuth>(
    FirebaseAuth.instanceFor(app: firebaseApp),
  );

  /// Initialize Firebase Cloud Storage
  FirebaseStorage storage = FirebaseStorage.instanceFor(app: firebaseApp);
  serviceLocator.registerSingleton<FirebaseStorage>(storage);
  serviceLocator.registerSingleton<FirebaseStorageClient>(
    FirebaseStorageClient(storage),
  );
  serviceLocator.registerSingleton<FirebaseStorageApiRepository>(
    FirebaseStorageDatasourceRepositoryImpl(
      serviceLocator<FirebaseStorageClient>(),
    ),
  );
}
