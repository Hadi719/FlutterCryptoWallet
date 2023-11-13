import '../../domain/models/requests/all_market_list_request.dart';
import '../../domain/models/requests/single_market_info_request.dart';
import '../../domain/models/responses/all_market_list_response.dart';
import '../../domain/models/responses/single_market_info_response.dart';
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
      request: () => _coinExApiService.getAllMarketList(),
    );
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
}
