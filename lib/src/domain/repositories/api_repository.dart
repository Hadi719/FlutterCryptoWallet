import '../../utils/resources/data_state.dart';
import '../models/requests/all_market_list_request.dart';
import '../models/responses/all_market_list_response.dart';

abstract class ApiRepository {
  Future<DataState<AllMarketListResponse>> getAllMarketList({
    required AllMarketListRequest request,
  });
}
