import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../src/domain/models/coincap/requests/requests.dart';
import '../../src/domain/models/coincap/responses/responses.dart';
import '../../src/domain/models/coinex/crypto.dart';
import '../../src/domain/models/coinex/requests/requests.dart';
import '../../src/domain/models/coinex/responses/responses.dart';
import '../../src/domain/repositories/coincap_api_repository.dart';
import '../../src/domain/repositories/coinex_api_repository.dart';
import '../../src/service_locator.dart';
import '../../src/utils/resources/data_state.dart';

part 'dev_coin_event.dart';
part 'dev_coin_state.dart';

class DevCoinBloc extends Bloc<DevCoinEvent, DevCoinState> {
  DevCoinBloc() : super(const DevCoinState()) {
    on<DevCoinChangeApi>(_onDevCoinChangeApi);

    // CoinCap
    on<DevCoinCapAssetsList>(_onDevCoinCapAssetsList);
    on<DevCoinCapAsset>(_onDevCoinCapAsset);
    on<DevCoinCapAssetHistory>(_onDevCoinCapAssetHistory);

    // CoinEX
    on<DevCoinExAllMarketList>(_onDevCoinExAllMarketList);
    on<DevCoinExAllMarketInfo>(_onDevCoinExAllMarketInfo);
    on<DevCoinExSingleMarketInfo>(_onDevCoinExSingleMarketInfo);
    on<DevCoinExMarketDepth>(_onDevCoinExMarketDepth);
    on<DevCoinExLatestTransactionData>(_onDevCoinExLatestTransactionData);
    on<DevCoinExKLineData>(_onDevCoinExKLineData);
    on<DevCoinExSingleMarketStatistics>(_onDevCoinExSingleMarketStatistics);
    on<DevCoinExAllMarketStatistics>(_onDevCoinExAllMarketStatistics);
    on<DevCoinExCurrencyRate>(_onDevCoinExCurrencyRate);
  }

  void _onDevCoinChangeApi(
    DevCoinChangeApi event,
    Emitter<DevCoinState> emit,
  ) {
    emit(state.copyWith(
      coinApi:
          state.coinApi == CoinApi.coinCap ? CoinApi.coinEx : CoinApi.coinCap,
    ));
  }

  Future<void> _onDevCoinCapAssetsList(
    DevCoinCapAssetsList event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapAssetsList(),
      ));
      final data = await _RemoteCoinCap.getAssetsList();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinCapAsset(
    DevCoinCapAsset event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapAsset(),
      ));
      final data = await _RemoteCoinCap.getAsset();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinCapAssetHistory(
    DevCoinCapAssetHistory event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapAsset(),
      ));
      final data = await _RemoteCoinCap.getAssetHistory();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinExAllMarketList(
    DevCoinExAllMarketList event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinExAllMarketList(),
      ));
      final data = await _RemoteCoinEx.getAllMarketList();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinExAllMarketInfo(
    DevCoinExAllMarketInfo event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinExAllMarketInfo(),
      ));
      final data = await _RemoteCoinEx.getAllMarketInfo();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinExSingleMarketInfo(
    DevCoinExSingleMarketInfo event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinExSingleMarketInfo(),
      ));
      final data = await _RemoteCoinEx.getSingleMarketInfo();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinExMarketDepth(
    DevCoinExMarketDepth event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinExMarketDepth(),
      ));
      final data = await _RemoteCoinEx.getMarketDepth();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinExLatestTransactionData(
    DevCoinExLatestTransactionData event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinExLatestTransactionData(),
      ));
      final data = await _RemoteCoinEx.getLatestTransactionData();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinExKLineData(
    DevCoinExKLineData event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinExKLineData(),
      ));
      final data = await _RemoteCoinEx.getKLineData();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinExSingleMarketStatistics(
    DevCoinExSingleMarketStatistics event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinExSingleMarketStatistics(),
      ));
      final data = await _RemoteCoinEx.getSingleMarketStatistics();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinExAllMarketStatistics(
    DevCoinExAllMarketStatistics event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinExAllMarketStatistics(),
      ));
      final data = await _RemoteCoinEx.getAllMarketStatistics();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }

  Future<void> _onDevCoinExCurrencyRate(
    DevCoinExCurrencyRate event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinExCurrencyRate(),
      ));
      final data = await _RemoteCoinEx.getCurrencyRate();
      emit(state.copyWith(
        status: DevCoinStatus.success,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DevCoinStatus.failure,
        error: e,
      ));
    }
  }
}

class _RemoteCoinEx {
  const _RemoteCoinEx();

  static Future<List<String>> getAllMarketList() async {
    final DataState<AllMarketListResponse> response =
        await serviceLocator<CoinExApiRepository>().getAllMarketList(
      request: const AllMarketListRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAllMarketList');
      return response.data!.data;
    } else {
      debugPrint('FAILED: $getAllMarketList');
      throw response.error!;
    }
  }

  static Future<List<SingleMarketInfoResponse>> getAllMarketInfo() async {
    final DataState<AllMarketInfoResponse> response =
        await serviceLocator<CoinExApiRepository>().getAllMarketInfo(
      request: const AllMarketInfoRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAllMarketInfo');
      return response.data!.data;
    } else {
      debugPrint('FAILED: $getAllMarketInfo');
      throw response.error!;
    }
  }

  static Future<SingleMarketInfoResponse> getSingleMarketInfo() async {
    final DataState<SingleMarketInfoResponse> response =
        await serviceLocator<CoinExApiRepository>().getSingleMarketInfo(
      request: SingleMarketInfoRequest(
          marketName: CoinExCryptoDetail.btc.marketName),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getSingleMarketInfo');
      return response.data!;
    } else {
      debugPrint('FAILED: $getSingleMarketInfo');
      throw response.error!;
    }
  }

  static Future<MarketDepthResponse> getMarketDepth() async {
    final DataState<MarketDepthResponse> response =
        await serviceLocator<CoinExApiRepository>().getMarketDepth(
      request: MarketDepthRequest(
        marketName: CoinExCryptoDetail.btc.marketName,
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getMarketDepth');
      return response.data!;
    } else {
      debugPrint('FAILED: $getMarketDepth');
      throw response.error!;
    }
  }

  static Future<LatestTransactionDataResponse>
      getLatestTransactionData() async {
    final DataState<LatestTransactionDataResponse> response =
        await serviceLocator<CoinExApiRepository>().getLatestTransactionData(
      request: LatestTransactionDataRequest(
        marketName: CoinExCryptoDetail.btc.marketName,
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getLatestTransactionData');
      return response.data!;
    } else {
      debugPrint('FAILED: $getLatestTransactionData');
      throw response.error!;
    }
  }

  static Future<KLineDataResponse> getKLineData() async {
    final DataState<KLineDataResponse> response =
        await serviceLocator<CoinExApiRepository>().getKLineData(
      request: KLineDataRequest(
        marketName: CoinExCryptoDetail.btc.marketName,
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getKLineData');
      return response.data!;
    } else {
      debugPrint('FAILED: $getKLineData');
      throw response.error!;
    }
  }

  static Future<SingleMarketStatisticsResponse>
      getSingleMarketStatistics() async {
    final DataState<SingleMarketStatisticsResponse> response =
        await serviceLocator<CoinExApiRepository>().getSingleMarketStatistics(
      request: SingleMarketStatisticsRequest(
        marketName: CoinExCryptoDetail.btc.marketName,
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getSingleMarketStatistics');
      return response.data!;
    } else {
      debugPrint('FAILED: $getSingleMarketStatistics');
      throw response.error!;
    }
  }

  static Future<AllMarketStatisticsResponse> getAllMarketStatistics() async {
    final DataState<AllMarketStatisticsResponse> response =
        await serviceLocator<CoinExApiRepository>().getAllMarketStatistics(
      request: const AllMarketStatisticsRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAllMarketStatistics');
      return response.data!;
    } else {
      debugPrint('FAILED: $getAllMarketStatistics');
      throw response.error!;
    }
  }

  static Future<CurrencyRateResponse> getCurrencyRate() async {
    final DataState<CurrencyRateResponse> response =
        await serviceLocator<CoinExApiRepository>().getCurrencyRate(
      request: const CurrencyRateRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getCurrencyRate');
      return response.data!;
    } else {
      debugPrint('FAILED: $getCurrencyRate');
      throw response.error!;
    }
  }
}

class _RemoteCoinCap {
  static Future<AssetsListResponse> getAssetsList() async {
    final DataState<AssetsListResponse> response =
        await serviceLocator<CoinCapApiRepository>().getAssetsList(
      request: const AssetsListRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAssetsList()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getAssetsList');
      throw response.error!;
    }
  }

  static Future<AssetResponse> getAsset() async {
    final DataState<AssetResponse> response =
        await serviceLocator<CoinCapApiRepository>().getAsset(
      request: const AssetRequest(id: 'bitcoin'),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAsset()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getAsset');
      throw response.error!;
    }
  }

  static Future<AssetHistoriesResponse> getAssetHistory() async {
    final DataState<AssetHistoriesResponse> response =
        await serviceLocator<CoinCapApiRepository>().getAssetHistory(
      request: const AssetHistoriesRequest(
        id: 'bitcoin',
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAssetHistory()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getAssetHistory');
      throw response.error!;
    }
  }
}
