import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../src/domain/models/coinex/crypto.dart';
import '../../src/domain/models/coinex/requests/requests.dart';
import '../../src/domain/models/coinex/responses/responses.dart';
import '../../src/domain/repositories/coinex_api_repository.dart';
import '../../src/service_locator.dart';
import '../../src/utils/resources/data_state.dart';

part 'test_ce_event.dart';
part 'test_ce_state.dart';

class TestCeBloc extends Bloc<TestCeEvent, TestCeState> {
  TestCeBloc() : super(const TestCeState()) {
    on<TestCeAllMarketList>(_onTestCeAllMarketList);
    on<TestCeAllMarketInfo>(_onTestCeAllMarketInfo);
    on<TestCeSingleMarketInfo>(_onTestCeSingleMarketInfo);
    on<TestCeMarketDepth>(_onTestCeMarketDepth);
    on<TestCeLatestTransactionData>(_onTestCeLatestTransactionData);
    on<TestCeKLineData>(_onTestCeKLineData);
    on<TestCeSingleMarketStatistics>(_onTestCeSingleMarketStatistics);
    on<TestCeAllMarketStatistics>(_onTestCeAllMarketStatistics);
    on<TestCeCurrencyRate>(_onTestCeCurrencyRate);
  }

  Future<void> _onTestCeAllMarketList(
    TestCeAllMarketList event,
    Emitter<TestCeState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: TestCeStatus.loading,
        lastEvent: TestCeAllMarketList(),
      ));
      final data = await RemoteCoinEx.getAllMarketList();
      emit(state.copyWith(
        status: TestCeStatus.success,
        data: data,
      ));
    } catch (_) {
      emit(state.copyWith(status: TestCeStatus.failure));
    }
  }

  Future<void> _onTestCeAllMarketInfo(
    TestCeAllMarketInfo event,
    Emitter<TestCeState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: TestCeStatus.loading,
        lastEvent: TestCeAllMarketInfo(),
      ));
      final data = await RemoteCoinEx.getAllMarketInfo();
      emit(state.copyWith(
        status: TestCeStatus.success,
        data: data,
      ));
    } catch (_) {
      emit(state.copyWith(status: TestCeStatus.failure));
    }
  }

  Future<void> _onTestCeSingleMarketInfo(
    TestCeSingleMarketInfo event,
    Emitter<TestCeState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: TestCeStatus.loading,
        lastEvent: TestCeSingleMarketInfo(),
      ));
      final data = await RemoteCoinEx.getSingleMarketInfo();
      emit(state.copyWith(
        status: TestCeStatus.success,
        data: data,
      ));
    } catch (_) {
      emit(state.copyWith(status: TestCeStatus.failure));
    }
  }

  Future<void> _onTestCeMarketDepth(
    TestCeMarketDepth event,
    Emitter<TestCeState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: TestCeStatus.loading,
        lastEvent: TestCeMarketDepth(),
      ));
      final data = await RemoteCoinEx.getMarketDepth();
      emit(state.copyWith(
        status: TestCeStatus.success,
        data: data,
      ));
    } catch (_) {
      emit(state.copyWith(status: TestCeStatus.failure));
    }
  }

  Future<void> _onTestCeLatestTransactionData(
    TestCeLatestTransactionData event,
    Emitter<TestCeState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: TestCeStatus.loading,
        lastEvent: TestCeLatestTransactionData(),
      ));
      final data = await RemoteCoinEx.getLatestTransactionData();
      emit(state.copyWith(
        status: TestCeStatus.success,
        data: data,
      ));
    } catch (_) {
      emit(state.copyWith(status: TestCeStatus.failure));
    }
  }

  Future<void> _onTestCeKLineData(
    TestCeKLineData event,
    Emitter<TestCeState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: TestCeStatus.loading,
        lastEvent: TestCeKLineData(),
      ));
      final data = await RemoteCoinEx.getKLineData();
      emit(state.copyWith(
        status: TestCeStatus.success,
        data: data,
      ));
    } catch (_) {
      emit(state.copyWith(status: TestCeStatus.failure));
    }
  }

  Future<void> _onTestCeSingleMarketStatistics(
    TestCeSingleMarketStatistics event,
    Emitter<TestCeState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: TestCeStatus.loading,
        lastEvent: TestCeSingleMarketStatistics(),
      ));
      final data = await RemoteCoinEx.getSingleMarketStatistics();
      emit(state.copyWith(
        status: TestCeStatus.success,
        data: data,
      ));
    } catch (_) {
      emit(state.copyWith(status: TestCeStatus.failure));
    }
  }

  Future<void> _onTestCeAllMarketStatistics(
    TestCeAllMarketStatistics event,
    Emitter<TestCeState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: TestCeStatus.loading,
        lastEvent: TestCeAllMarketStatistics(),
      ));
      final data = await RemoteCoinEx.getAllMarketStatistics();
      emit(state.copyWith(
        status: TestCeStatus.success,
        data: data,
      ));
    } catch (_) {
      emit(state.copyWith(status: TestCeStatus.failure));
    }
  }

  Future<void> _onTestCeCurrencyRate(
    TestCeCurrencyRate event,
    Emitter<TestCeState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: TestCeStatus.loading,
        lastEvent: TestCeCurrencyRate(),
      ));
      final data = await RemoteCoinEx.getCurrencyRate();
      emit(state.copyWith(
        status: TestCeStatus.success,
        data: data,
      ));
    } catch (_) {
      emit(state.copyWith(status: TestCeStatus.failure));
    }
  }
}

class RemoteCoinEx {
  const RemoteCoinEx();

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
