import '../../utils/resources/data_state.dart';
import '../models/requests/all_market_info_request.dart';
import '../models/requests/all_market_list_request.dart';
import '../models/requests/all_market_statistics_request.dart';
import '../models/requests/k_line_data_request.dart';
import '../models/requests/latest_transaction_data_request.dart';
import '../models/requests/market_depth_request.dart';
import '../models/requests/single_market_info_request.dart';
import '../models/requests/single_market_statistics_request.dart';
import '../models/responses/all_market_info_response.dart';
import '../models/responses/all_market_list_response.dart';
import '../models/responses/all_market_statistics_response.dart';
import '../models/responses/k_line_data_response.dart';
import '../models/responses/latest_transaction_data_response.dart';
import '../models/responses/market_depth_response.dart';
import '../models/responses/single_market_info_response.dart';
import '../models/responses/single_market_statistics_response.dart';

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
}
