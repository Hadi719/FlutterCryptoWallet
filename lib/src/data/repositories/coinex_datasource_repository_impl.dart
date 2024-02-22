import '../../domain/models/coinex/requests/requests.dart';
import '../../domain/models/coinex/responses/responses.dart';
import '../../domain/repositories/coinex_api_repository.dart';
import '../../config/utils/resources/data_state.dart';
import '../datasource/remote/coinex_remote_client.dart';
import 'base/base_datasource_repository.dart';

class CoinExDataSourceRepositoryImpl extends BaseDataSourceRepository
    implements CoinExApiRepository {
  final CoinExRemoteClient _coinExRemoteClient;

  CoinExDataSourceRepositoryImpl(this._coinExRemoteClient);

  @override
  Future<DataState<AllMarketInfoResponse>> getAllMarketInfo({
    required AllMarketInfoRequest request,
  }) {
    return getStateOf<AllMarketInfoResponse>(
        request: () => _coinExRemoteClient.getAllMarketInfo());
  }

  @override
  Future<DataState<AllMarketListResponse>> getAllMarketList({
    required AllMarketListRequest request,
  }) {
    return getStateOf<AllMarketListResponse>(
        request: () => _coinExRemoteClient.getAllMarketList());
  }

  @override
  Future<DataState<AllMarketStatisticsResponse>> getAllMarketStatistics(
      {required AllMarketStatisticsRequest request}) {
    return getStateOf<AllMarketStatisticsResponse>(
        request: () => _coinExRemoteClient.getAllMarketStatistics());
  }

  @override
  Future<DataState<CurrencyRateResponse>> getCurrencyRate(
      {required CurrencyRateRequest request}) {
    return getStateOf<CurrencyRateResponse>(
        request: () => _coinExRemoteClient.getCurrencyRate());
  }

  @override
  Future<DataState<KLineDataResponse>> getKLineData(
      {required KLineDataRequest request}) {
    return getStateOf<KLineDataResponse>(
        request: () => _coinExRemoteClient.getKLineData(
              marketName: request.marketName,
              limit: request.limit,
              type: request.type.value,
            ));
  }

  @override
  Future<DataState<LatestTransactionDataResponse>> getLatestTransactionData(
      {required LatestTransactionDataRequest request}) {
    return getStateOf<LatestTransactionDataResponse>(
        request: () => _coinExRemoteClient.getLatestTransactionData(
              marketName: request.marketName,
              lastId: request.lastId,
              limit: request.limit,
            ));
  }

  @override
  Future<DataState<MarketDepthResponse>> getMarketDepth(
      {required MarketDepthRequest request}) {
    return getStateOf<MarketDepthResponse>(
        request: () => _coinExRemoteClient.getMarketDepth(
              marketName: request.marketName,
              merge: request.merge.value,
              limit: request.limit?.value,
            ));
  }

  @override
  Future<DataState<SingleMarketInfoResponse>> getSingleMarketInfo({
    required SingleMarketInfoRequest request,
  }) {
    return getStateOf<SingleMarketInfoResponse>(
      request: () => _coinExRemoteClient.getSingleMarketInfo(
        marketName: request.marketName,
      ),
    );
  }

  @override
  Future<DataState<SingleMarketStatisticsResponse>> getSingleMarketStatistics(
      {required SingleMarketStatisticsRequest request}) {
    return getStateOf<SingleMarketStatisticsResponse>(
        request: () => _coinExRemoteClient.getSingleMarketStatistics(
              marketName: request.marketName,
            ));
  }
}
