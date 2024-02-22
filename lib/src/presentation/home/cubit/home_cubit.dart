import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../config/utils/resources/data_state.dart';
import '../../../domain/models/coingecko/request/request.dart';
import '../../../domain/models/coingecko/response/response.dart';
import '../../../domain/repositories/coingecko_api_repository.dart';
import '../../../service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CoinGeckoApiRepository geckoRepo =
      serviceLocator<CoinGeckoApiRepository>();

  HomeCubit() : super(const HomeState());

  Future<void> getCoinsMarketsList() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final DataState<CoinsMarketsListResponse> response =
        await geckoRepo.getCoinsMarketsList(
      /// Todo: add Currencies, Order,
      request: CoinsMarketsListRequest(
        vsCurrency: 'usd',
        perPage: 10,
        page: 1,
      ),
    );
    if (response is DataSuccess) {
      emit(state.copyWith(
        status: HomeStatus.success,
        coins: response.data?.data,
      ));
    } else {
      emit(state.copyWith(
        status: HomeStatus.failure,
        error: response.error,
      ));
    }
  }
}
