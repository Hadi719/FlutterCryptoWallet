import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/remote/coin_ex_api_service.dart';
import 'data/repositories/api_repository_impl.dart';
import 'domain/repositories/api_repository.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setup() async {
  final dio = Dio();

  serviceLocator.registerSingleton<Dio>(dio);

  serviceLocator.registerSingleton<CoinExApiService>(
    CoinExApiService(serviceLocator<Dio>()),
  );

  serviceLocator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(serviceLocator<CoinExApiService>()),
  );
}
