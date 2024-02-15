import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../src/domain/models/coincap/requests/requests.dart';
import '../../src/domain/models/coincap/responses/responses.dart';
import '../../src/domain/models/coinex/crypto.dart';
import '../../src/domain/models/coinex/requests/requests.dart';
import '../../src/domain/models/coinex/responses/responses.dart';
import '../../src/domain/models/coingecko/request/request.dart';
import '../../src/domain/models/coingecko/response/response.dart';
import '../../src/domain/repositories/coincap_api_repository.dart';
import '../../src/domain/repositories/coinex_api_repository.dart';
import '../../src/domain/repositories/coingecko_api_repository.dart';
import '../../src/service_locator.dart';
import '../../src/utils/resources/data_state.dart';

part 'dev_coin_event.dart';
part 'dev_coin_state.dart';

class DevCoinBloc extends Bloc<DevCoinEvent, DevCoinState> {
  DevCoinBloc() : super(const DevCoinState()) {
    on<DevCoinChangeApi>(_onDevCoinChangeApi);
    // CoinGecko
    on<DevCoinGeckoSimplePricesList>(_onDevCoinGeckoSimplePricesList);
    on<DevCoinGeckoSimpleSupportedVsCurrencies>(
        _onDevCoinGeckoSimpleSupportedVsCurrencies);
    on<DevCoinGeckoCoinMetadata>(_onDevCoinGeckoCoinMetadata);
    on<DevCoinGeckoCoinHistory>(_onDevCoinGeckoCoinHistory);
    on<DevCoinGeckoCoinsMarketsList>(_onDevCoinGeckoCoinsMarketsList);
    on<DevCoinGeckoCoinMarketChart>(_onDevCoinGeckoCoinMarketChart);
    on<DevCoinGeckoCoinMarketChartRange>(_onDevCoinGeckoCoinMarketChartRange);
    on<DevCoinGeckoCoinOHLC>(_onDevCoinGeckoCoinOHLC);
    on<DevCoinGeckoAssetPlatformsList>(_onDevCoinGeckoAssetPlatformsList);
    on<DevCoinGeckoExchangeRates>(_onDevCoinGeckoExchangeRates);

    // CoinCap
    on<DevCoinCapAssetsList>(_onDevCoinCapAssetsList);
    on<DevCoinCapAsset>(_onDevCoinCapAsset);
    on<DevCoinCapAssetHistories>(_onDevCoinCapAssetHistories);
    on<DevCoinCapAssetMarkets>(_onDevCoinCapAssetMarkets);
    on<DevCoinCapRatesList>(_onDevCoinCapRatesList);
    on<DevCoinCapRate>(_onDevCoinCapRate);
    on<DevCoinCapExchangesList>(_onDevCoinCapExchangesList);
    on<DevCoinCapExchange>(_onDevCoinCapExchange);
    on<DevCoinCapMarketsList>(_onDevCoinCapMarketsList);
    on<DevCoinCapCandlesList>(_onDevCoinCapCandlesList);

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
    CoinApi currentCoinApi;

    switch (state.coinApi) {
      case CoinApi.coinGecko:
        currentCoinApi = CoinApi.coinCap;
        break;
      case CoinApi.coinCap:
        currentCoinApi = CoinApi.coinEx;
        break;
      case CoinApi.coinEx:
      default:
        currentCoinApi = CoinApi.coinGecko;
        break;
    }

    emit(state.copyWith(coinApi: currentCoinApi));
  }

  // CoinGecko -- Simple
  Future<void> _onDevCoinGeckoSimplePricesList(
    DevCoinGeckoSimplePricesList event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinGeckoSimplePricesList(),
      ));
      final data = await _RemoteCoinGecko.getSimplePricesList();
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

  Future<void> _onDevCoinGeckoSimpleSupportedVsCurrencies(
    DevCoinGeckoSimpleSupportedVsCurrencies event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinGeckoSimpleSupportedVsCurrencies(),
      ));
      final data = await _RemoteCoinGecko.getSimpleSupportedVsCurrencies();
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

  // CoinGecko -- Coins
  Future<void> _onDevCoinGeckoCoinMetadata(
    DevCoinGeckoCoinMetadata event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinGeckoCoinMetadata(),
      ));
      final data = await _RemoteCoinGecko.getCoinMetadata();
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

  Future<void> _onDevCoinGeckoCoinHistory(
    DevCoinGeckoCoinHistory event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinGeckoCoinHistory(),
      ));
      final data = await _RemoteCoinGecko.getCoinHistory();
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

  Future<void> _onDevCoinGeckoCoinsMarketsList(
    DevCoinGeckoCoinsMarketsList event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinGeckoCoinsMarketsList(),
      ));
      final data = await _RemoteCoinGecko.getCoinsMarketsList();
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

  Future<void> _onDevCoinGeckoCoinMarketChart(
    DevCoinGeckoCoinMarketChart event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinGeckoCoinMarketChart(),
      ));
      final data = await _RemoteCoinGecko.getCoinMarketChart();
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

  Future<void> _onDevCoinGeckoCoinMarketChartRange(
    DevCoinGeckoCoinMarketChartRange event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinGeckoCoinMarketChartRange(),
      ));
      final data = await _RemoteCoinGecko.getCoinMarketChartRange();
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

  Future<void> _onDevCoinGeckoCoinOHLC(
    DevCoinGeckoCoinOHLC event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinGeckoCoinOHLC(),
      ));
      final data = await _RemoteCoinGecko.getCoinOHLC();
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

  Future<void> _onDevCoinGeckoAssetPlatformsList(
    DevCoinGeckoAssetPlatformsList event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinGeckoAssetPlatformsList(),
      ));
      final data = await _RemoteCoinGecko.getAssetPlatformsList();
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

  Future<void> _onDevCoinGeckoExchangeRates(
    DevCoinGeckoExchangeRates event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinGeckoExchangeRates(),
      ));
      final data = await _RemoteCoinGecko.getExchangeRates();
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

  // CoinCap -- Assets
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

  Future<void> _onDevCoinCapAssetHistories(
    DevCoinCapAssetHistories event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapAssetHistories(),
      ));
      final data = await _RemoteCoinCap.getAssetHistories();
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

  Future<void> _onDevCoinCapAssetMarkets(
    DevCoinCapAssetMarkets event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapAssetMarkets(),
      ));
      final data = await _RemoteCoinCap.getAssetMarkets();
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

  // CoinCap -- Rates
  Future<void> _onDevCoinCapRatesList(
    DevCoinCapRatesList event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapRatesList(),
      ));
      final data = await _RemoteCoinCap.getRatesList();
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

  Future<void> _onDevCoinCapRate(
    DevCoinCapRate event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapRate(),
      ));
      final data = await _RemoteCoinCap.getRate();
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

  // CoinCap -- Exchanges
  Future<void> _onDevCoinCapExchangesList(
    DevCoinCapExchangesList event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapExchangesList(),
      ));
      final data = await _RemoteCoinCap.getExchangesList();
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

  Future<void> _onDevCoinCapExchange(
    DevCoinCapExchange event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapExchange(),
      ));
      final data = await _RemoteCoinCap.getExchange();
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

  // CoinCap -- Markets
  Future<void> _onDevCoinCapMarketsList(
    DevCoinCapMarketsList event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapMarketsList(),
      ));
      final data = await _RemoteCoinCap.getMarketsList();
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

  // CoinCap -- Candles
  Future<void> _onDevCoinCapCandlesList(
    DevCoinCapCandlesList event,
    Emitter<DevCoinState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: DevCoinStatus.loading,
        lastEvent: DevCoinCapCandlesList(),
      ));
      final data = await _RemoteCoinCap.getCandlesList();
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

  // CoinEx
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
  // Assets
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

  static Future<AssetHistoriesResponse> getAssetHistories() async {
    final DataState<AssetHistoriesResponse> response =
        await serviceLocator<CoinCapApiRepository>().getAssetHistories(
      request: const AssetHistoriesRequest(
        id: 'bitcoin',
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAssetHistories()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getAssetHistories');
      throw response.error!;
    }
  }

  static Future<AssetMarketsResponse> getAssetMarkets() async {
    final DataState<AssetMarketsResponse> response =
        await serviceLocator<CoinCapApiRepository>().getAssetMarkets(
      request: const AssetMarketsRequest(
        id: 'bitcoin',
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAssetMarkets()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getAssetMarkets');
      throw response.error!;
    }
  }

  // Rates
  static Future<RatesListResponse> getRatesList() async {
    final DataState<RatesListResponse> response =
        await serviceLocator<CoinCapApiRepository>().getRatesList(
      request: const RatesListRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getRatesList()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getRatesList');
      throw response.error!;
    }
  }

  static Future<RateResponse> getRate() async {
    final DataState<RateResponse> response =
        await serviceLocator<CoinCapApiRepository>().getRate(
      request: const RateRequest(
        id: 'lebanese-pound',
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getRate()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getRate');
      throw response.error!;
    }
  }

  // Exchanges
  static Future<ExchangesListResponse> getExchangesList() async {
    final DataState<ExchangesListResponse> response =
        await serviceLocator<CoinCapApiRepository>().getExchangesList(
      request: const ExchangesListRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getExchangesList()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getExchangesList');
      throw response.error!;
    }
  }

  static Future<ExchangeResponse> getExchange() async {
    final DataState<ExchangeResponse> response =
        await serviceLocator<CoinCapApiRepository>().getExchange(
      request: const ExchangeRequest(
        id: 'kraken',
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getExchange()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getExchange');
      throw response.error!;
    }
  }

  // Markets
  static Future<MarketsListResponse> getMarketsList() async {
    final DataState<MarketsListResponse> response =
        await serviceLocator<CoinCapApiRepository>().getMarketsList(
      request: const MarketsListRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getMarketsList()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getMarketsList');
      throw response.error!;
    }
  }

  // Markets
  static Future<CandlesListResponse> getCandlesList() async {
    final DataState<CandlesListResponse> response =
        await serviceLocator<CoinCapApiRepository>().getCandlesList(
      request: const CandlesListRequest(
        exchange: 'poloniex',
        interval: CandlesIntervals.h8,
        baseId: 'ethereum',
        quoteId: 'bitcoin',
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getCandlesList()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getCandlesList');
      throw response.error!;
    }
  }
}

class _RemoteCoinGecko {
  static Future<SimplePricesListResponse> getSimplePricesList() async {
    final DataState<SimplePricesListResponse> response =
        await serviceLocator<CoinGeckoApiRepository>().getSimplePricesList(
      request: const SimplePriceRequest(
        ids: 'bitcoin,ethereum',
        vsCurrencies: 'usd',
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getSimplePricesList()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getSimplePricesList');
      throw response.error!;
    }
  }

  static Future<SimpleSupportedVsCurrenciesResponse>
      getSimpleSupportedVsCurrencies() async {
    final DataState<SimpleSupportedVsCurrenciesResponse> response =
        await serviceLocator<CoinGeckoApiRepository>()
            .getSimpleSupportedVsCurrencies(
                request: const SimpleSupportedVsCurrenciesRequest());
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getSimpleSupportedVsCurrencies()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getSimpleSupportedVsCurrencies');
      throw response.error!;
    }
  }

  static Future<CoinMetadataResponse> getCoinMetadata() async {
    final DataState<CoinMetadataResponse> response =
        await serviceLocator<CoinGeckoApiRepository>().getCoinMetadata(
      request: const CoinMetadataRequest(
        id: 'ethereum',
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getCoinMetadata()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getCoinMetadata');
      throw response.error!;
    }
  }

  static Future<CoinHistoryResponse> getCoinHistory() async {
    final DataState<CoinHistoryResponse> response =
        await serviceLocator<CoinGeckoApiRepository>().getCoinHistory(
      request: const CoinHistoryRequest(id: 'ethereum', date: '26-01-2024'),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getCoinHistory()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getCoinHistory');
      throw response.error!;
    }
  }

  static Future<CoinsMarketsListResponse> getCoinsMarketsList() async {
    final DataState<CoinsMarketsListResponse> response =
        await serviceLocator<CoinGeckoApiRepository>().getCoinsMarketsList(
      request: CoinsMarketsListRequest(vsCurrency: 'usd'),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getCoinsMarketsList()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getCoinsMarketsList');
      throw response.error!;
    }
  }

  static Future<CoinMarketChartResponse> getCoinMarketChart() async {
    final DataState<CoinMarketChartResponse> response =
        await serviceLocator<CoinGeckoApiRepository>().getCoinMarketChart(
      request: const CoinMarketChartRequest(id: 'bitcoin'),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getCoinMarketChart()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getCoinMarketChart');
      throw response.error!;
    }
  }

  static Future<CoinMarketChartRangeResponse> getCoinMarketChartRange() async {
    final DataState<CoinMarketChartRangeResponse> response =
        await serviceLocator<CoinGeckoApiRepository>().getCoinMarketChartRange(
      request: const CoinMarketChartRangeRequest(
        id: 'bitcoin',
        from: 1392577232,
        to: 1422577232,
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getCoinMarketChartRange()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getCoinMarketChartRange');
      throw response.error!;
    }
  }

  static Future<CoinOHLCResponse> getCoinOHLC() async {
    final DataState<CoinOHLCResponse> response =
        await serviceLocator<CoinGeckoApiRepository>().getCoinOHLC(
      request: const CoinOHLCRequest(
        id: 'bitcoin',
        days: 7,
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getCoinOHLC()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getCoinOHLC');
      throw response.error!;
    }
  }

  static Future<AssetPlatformsListResponse> getAssetPlatformsList() async {
    final DataState<AssetPlatformsListResponse> response =
        await serviceLocator<CoinGeckoApiRepository>().getAssetPlatformsList(
      request: const AssetPlatformsListRequest(
          // filter: 'nft',
          ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAssetPlatformsList()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getAssetPlatformsList');
      throw response.error!;
    }
  }

  static Future<ExchangeRatesResponse> getExchangeRates() async {
    final DataState<ExchangeRatesResponse> response =
        await serviceLocator<CoinGeckoApiRepository>().getExchangeRates(
      request: const ExchangeRatesRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getExchangeRates()');
      return response.data!;
    } else {
      debugPrint('FAILED: $getExchangeRates');
      throw response.error!;
    }
  }
}
