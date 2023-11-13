import '../../utils/resources/data_state.dart';
import '../models/requests/all_market_info_request.dart';
import '../models/requests/all_market_list_request.dart';
import '../models/requests/single_market_info_request.dart';
import '../models/responses/all_market_info_response.dart';
import '../models/responses/all_market_list_response.dart';
import '../models/responses/single_market_info_response.dart';

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
}
