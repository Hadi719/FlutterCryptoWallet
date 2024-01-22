import '../../domain/models/coincap/requests/requests.dart';
import '../../domain/models/coincap/responses/responses.dart';
import '../../domain/repositories/coincap_api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../datasource/remote/coincap_remote_datasource.dart';
import 'base/base_datasource_repository.dart';

class CoinCapDataSourceRepositoryImpl extends BaseDataSourceRepository
    implements CoinCapApiRepository {
  final CoinCapRemoteDataSource _coinCapRemoteDataSource;

  CoinCapDataSourceRepositoryImpl(this._coinCapRemoteDataSource);

  @override
  Future<DataState<AssetsListResponse>> getAssetsList({
    required AssetsListRequest request,
  }) {
    return getStateOf<AssetsListResponse>(
      request: () => _coinCapRemoteDataSource.getAssetsList(
        search: request.search,
        ids: request.ids,
        limit: request.limit,
        offset: request.offset,
      ),
    );
  }

  @override
  Future<DataState<AssetResponse>> getAsset({
    required AssetRequest request,
  }) {
    return getStateOf<AssetResponse>(
        request: () => _coinCapRemoteDataSource.getAsset(
              id: request.id,
            ));
  }

  @override
  Future<DataState<AssetHistoriesResponse>> getAssetHistories({
    required AssetHistoriesRequest request,
  }) {
    return getStateOf<AssetHistoriesResponse>(
        request: () => _coinCapRemoteDataSource.getAssetHistories(
              id: request.id,
              interval: request.interval.value,
              start: request.start,
              end: request.end,
            ));
  }

  @override
  Future<DataState<AssetMarketsResponse>> getAssetMarkets({
    required AssetMarketsRequest request,
  }) {
    return getStateOf<AssetMarketsResponse>(
        request: () => _coinCapRemoteDataSource.getAssetMarkets(
              id: request.id,
              limit: request.limit,
              offset: request.offset,
            ));
  }

  @override
  Future<DataState<RatesListResponse>> getRatesList(
      {required RatesListRequest request}) {
    return getStateOf<RatesListResponse>(
      request: () => _coinCapRemoteDataSource.getRatesList(),
    );
  }

  @override
  Future<DataState<RateResponse>> getRate({required RateRequest request}) {
    return getStateOf(
        request: () => _coinCapRemoteDataSource.getRate(
              id: request.id,
            ));
  }
}
