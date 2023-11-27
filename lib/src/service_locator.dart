import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'config/firebase/firebase_options.dart';
import 'data/datasource/remote/coin_ex_api_service.dart';
import 'data/repositories/api_repository_impl.dart';
import 'domain/repositories/api_repository.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setup() async {
  final Dio dio = Dio();

  serviceLocator.registerSingleton<Dio>(dio);

  _setupCoinExApi();

  await _setupFirebase();
}

void _setupCoinExApi() {
  serviceLocator.registerSingleton<CoinExApiService>(
    CoinExApiService(
      serviceLocator<Dio>(),
    ),
  );

  serviceLocator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(
      serviceLocator<CoinExApiService>(),
    ),
  );
}

Future<void> _setupFirebase() async {
  final FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  serviceLocator.registerSingleton<FirebaseApp>(firebaseApp);

  serviceLocator.registerSingleton<FirebaseAuth>(
    FirebaseAuth.instanceFor(
      app: serviceLocator<FirebaseApp>(),
    ),
  );
}
