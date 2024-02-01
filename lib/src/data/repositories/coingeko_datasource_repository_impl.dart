import '../../domain/models/coingecko/request/simple/simple_price_request.dart';
import '../../domain/models/coingecko/response/simple/simple_price_response.dart';
import '../../domain/repositories/coingecko_api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../datasource/remote/coingecko_remote_client.dart';
import 'base/base_datasource_repository.dart';

class CoinGeckoDataSourceRepositoryImpl extends BaseDataSourceRepository
    implements CoinGeckoApiRepository {
  final CoinGeckoRemoteClient _coinGeckoRemoteClient;

  CoinGeckoDataSourceRepositoryImpl(this._coinGeckoRemoteClient);

  @override
  Future<DataState<SimplePricesListResponse>> getSimplePricesList(
      {required SimplePriceRequest request}) {
    return getStateOf<SimplePricesListResponse>(
      request: () => _coinGeckoRemoteClient.getSimplePricesList(
        ids: request.ids,
        vsCurrencies: request.vsCurrencies,
        includeMarketCap: request.includeMarketCap,
        include24hrVol: request.include24hrVol,
        include24hrChange: request.include24hrChange,
        includeLastUpdatedAt: request.includeLastUpdatedAt,
        precision: request.precision,
      ),
    );
  }

/*  @override
  Future<DataState<AssetHistoriesResponse>> getAssetHistories({
    required AssetHistoriesRequest request,
  }) {
    return getStateOf<AssetHistoriesResponse>(
        request: () => _coinCapRemoteDataSource.getAssetHistories(
          id: request.id,
          interval: request.interval.name,
          start: request.start,
          end: request.end,
        ));
  }*/
}
