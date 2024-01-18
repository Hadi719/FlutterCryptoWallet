import '../../utils/resources/data_state.dart';
import '../models/coinex/requests/requests.dart';
import '../models/coinex/responses/responses.dart';

abstract class ApiRepository {
  Future<DataState<AllMarketListResponse>> getAllMarketList({
    required AllMarketListRequest request,
  });

  Future<DataState<AllMarketInfoResponse>> getAllMarketInfo({
    required AllMarketInfoRequest request,
  });

  Future<DataState<SingleMarketInfoResponse>> getSingleMarketInfo({
    required SingleMarketInfoRequest request,
  });

  Future<DataState<MarketDepthResponse>> getMarketDepth({
    required MarketDepthRequest request,
  });

  Future<DataState<LatestTransactionDataResponse>> getLatestTransactionData({
    required LatestTransactionDataRequest request,
  });

  Future<DataState<KLineDataResponse>> getKLineData({
    required KLineDataRequest request,
  });

  Future<DataState<SingleMarketStatisticsResponse>> getSingleMarketStatistics({
    required SingleMarketStatisticsRequest request,
  });

  Future<DataState<AllMarketStatisticsResponse>> getAllMarketStatistics({
    required AllMarketStatisticsRequest request,
  });

  Future<DataState<CurrencyRateResponse>> getCurrencyRate({
    required CurrencyRateRequest request,
  });
}
