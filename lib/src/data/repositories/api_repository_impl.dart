import '../../domain/models/requests/all_market_info_request.dart';
import '../../domain/models/requests/all_market_list_request.dart';
import '../../domain/models/requests/all_market_statistics_request.dart';
import '../../domain/models/requests/currency_rate_request.dart';
import '../../domain/models/requests/k_line_data_request.dart';
import '../../domain/models/requests/latest_transaction_data_request.dart';
import '../../domain/models/requests/market_depth_request.dart';
import '../../domain/models/requests/single_market_info_request.dart';
import '../../domain/models/requests/single_market_statistics_request.dart';
import '../../domain/models/responses/all_market_info_response.dart';
import '../../domain/models/responses/all_market_list_response.dart';
import '../../domain/models/responses/all_market_statistics_response.dart';
import '../../domain/models/responses/currency_rate_response.dart';
import '../../domain/models/responses/k_line_data_response.dart';
import '../../domain/models/responses/latest_transaction_data_response.dart';
import '../../domain/models/responses/market_depth_response.dart';
import '../../domain/models/responses/single_market_info_response.dart';
import '../../domain/models/responses/single_market_statistics_response.dart';
import '../../domain/repositories/api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../datasource/remote/coin_ex_api_service.dart';
import 'base/base_api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final CoinExApiService _coinExApiService;

  ApiRepositoryImpl(this._coinExApiService);

  @override
  Future<DataState<AllMarketListResponse>> getAllMarketList({
    required AllMarketListRequest request,
  }) {
    return getStateOf<AllMarketListResponse>(
        request: () => _coinExApiService.getAllMarketList());
  }

  @override
  Future<DataState<AllMarketInfoResponse>> getAllMarketInfo({
    required AllMarketInfoRequest request,
  }) {
    return getStateOf(request: () => _coinExApiService.getAllMarketInfo());
  }

  @override
  Future<DataState<SingleMarketInfoResponse>> getSingleMarketInfo({
    required SingleMarketInfoRequest request,
  }) {
    return getStateOf(
      request: () =>
          _coinExApiService.getSingleMarketInfo(marketName: request.marketName),
    );
  }

  @override
  Future<DataState<MarketDepthResponse>> getMarketDepth(
      {required MarketDepthRequest request}) {
    return getStateOf(
        request: () => _coinExApiService.getMarketDepth(
              marketName: request.marketName,
              merge: request.merge.value,
              limit: request.limit?.value,
            ));
  }

  @override
  Future<DataState<LatestTransactionDataResponse>> getLatestTransactionData(
      {required LatestTransactionDataRequest request}) {
    return getStateOf(
        request: () => _coinExApiService.getLatestTransactionData(
              marketName: request.marketName,
              lastId: request.lastId,
              limit: request.limit,
            ));
  }

  @override
  Future<DataState<KLineDataResponse>> getKLineData(
      {required KLineDataRequest request}) {
    return getStateOf(
        request: () => _coinExApiService.getKLineData(
              marketName: request.marketName,
              limit: request.limit,
              type: request.type.value,
            ));
  }

  @override
  Future<DataState<SingleMarketStatisticsResponse>> getSingleMarketStatistics(
      {required SingleMarketStatisticsRequest request}) {
    return getStateOf(
        request: () => _coinExApiService.getSingleMarketStatistics(
              marketName: request.marketName,
            ));
  }

  @override
  Future<DataState<AllMarketStatisticsResponse>> getAllMarketStatistics(
      {required AllMarketStatisticsRequest request}) {
    return getStateOf(
        request: () => _coinExApiService.getAllMarketStatistics());
  }

  @override
  Future<DataState<CurrencyRateResponse>> getCurrencyRate(
      {required CurrencyRateRequest request}) {
    return getStateOf(request: () => _coinExApiService.getCurrencyRate());
  }
}
