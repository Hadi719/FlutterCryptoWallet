import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/coinex/requests/all_market_statistics_request.dart';
import '../../../domain/models/coinex/responses/all_market_statistics_response.dart';
import '../../../domain/repositories/coinex_api_repository.dart';
import '../../../service_locator.dart';
import '../../../utils/resources/data_state.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final coinExRepo = serviceLocator<CoinExApiRepository>();

  Future<void> getAllMarketStatistics() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final response = await coinExRepo.getAllMarketStatistics(
      request: const AllMarketStatisticsRequest(),
    );
    if (response is DataSuccess) {
      emit(state.copyWith(
        status: HomeStatus.success,
        allMarketStatisticsResponse: response.data,
      ));
    } else {
      emit(state.copyWith(
        status: HomeStatus.failure,
        error: response.error,
      ));
    }
  }
}
