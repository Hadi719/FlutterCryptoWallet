import '../../utils/resources/data_state.dart';
import '../models/coingecko/request/request.dart';
import '../models/coingecko/response/response.dart';

abstract class CoinGeckoApiRepository {
  Future<DataState<SimplePricesListResponse>> getSimplePricesList({
    required SimplePriceRequest request,
  });

/*  Future<DataState<AssetsListResponse>> getAssetsList({
    required AssetsListRequest request,
  });*/
}
