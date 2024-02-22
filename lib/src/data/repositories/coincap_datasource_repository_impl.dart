import '../../config/utils/resources/data_state.dart';
import '../../domain/models/coincap/requests/requests.dart';
import '../../domain/models/coincap/responses/responses.dart';
import '../../domain/repositories/coincap_api_repository.dart';
import '../datasource/remote/coincap_remote_client.dart';
import 'base/base_datasource_repository.dart';

class CoinCapDataSourceRepositoryImpl extends BaseDataSourceRepository
    implements CoinCapApiRepository {
  final CoinCapRemoteClient _coinCapRemoteClient;

  CoinCapDataSourceRepositoryImpl(this._coinCapRemoteClient);

  @override
  Future<DataState<AssetResponse>> getAsset({
    required AssetRequest request,
  }) {
    return getStateOf<AssetResponse>(
        request: () => _coinCapRemoteClient.getAsset(
              id: request.id,
            ));
  }

  @override
  Future<DataState<AssetHistoriesResponse>> getAssetHistories({
    required AssetHistoriesRequest request,
  }) {
    return getStateOf<AssetHistoriesResponse>(
        request: () => _coinCapRemoteClient.getAssetHistories(
              id: request.id,
              interval: request.interval.name,
              start: request.start,
              end: request.end,
            ));
  }

  @override
  Future<DataState<AssetMarketsResponse>> getAssetMarkets({
    required AssetMarketsRequest request,
  }) {
    return getStateOf<AssetMarketsResponse>(
        request: () => _coinCapRemoteClient.getAssetMarkets(
              id: request.id,
              limit: request.limit,
              offset: request.offset,
            ));
  }

  @override
  Future<DataState<AssetsListResponse>> getAssetsList({
    required AssetsListRequest request,
  }) {
    return getStateOf<AssetsListResponse>(
      request: () => _coinCapRemoteClient.getAssetsList(
        search: request.search,
        ids: request.ids,
        limit: request.limit,
        offset: request.offset,
      ),
    );
  }

  @override
  Future<DataState<CandlesListResponse>> getCandlesList(
      {required CandlesListRequest request}) {
    return getStateOf<CandlesListResponse>(
      request: () => _coinCapRemoteClient.getCandlesList(
        exchange: request.exchange,
        interval: request.interval.name,
        baseId: request.baseId,
        quoteId: request.quoteId,
        start: request.start,
        end: request.end,
      ),
    );
  }

  @override
  Future<DataState<ExchangeResponse>> getExchange(
      {required ExchangeRequest request}) {
    return getStateOf<ExchangeResponse>(
        request: () => _coinCapRemoteClient.getExchange(
              id: request.id,
            ));
  }

  @override
  Future<DataState<ExchangesListResponse>> getExchangesList(
      {required ExchangesListRequest request}) {
    return getStateOf<ExchangesListResponse>(
      request: () => _coinCapRemoteClient.getExchangesList(),
    );
  }

  @override
  Future<DataState<MarketsListResponse>> getMarketsList(
      {required MarketsListRequest request}) {
    return getStateOf<MarketsListResponse>(
      request: () => _coinCapRemoteClient.getMarketsList(
        exchangeId: request.exchangeId,
        baseSymbol: request.baseSymbol,
        quoteSymbol: request.quoteSymbol,
        baseId: request.baseId,
        quoteId: request.quoteId,
        assetSymbol: request.assetSymbol,
        assetId: request.assetId,
        limit: request.limit,
        offset: request.offset,
      ),
    );
  }

  @override
  Future<DataState<RateResponse>> getRate({required RateRequest request}) {
    return getStateOf<RateResponse>(
        request: () => _coinCapRemoteClient.getRate(
              id: request.id,
            ));
  }

  @override
  Future<DataState<RatesListResponse>> getRatesList(
      {required RatesListRequest request}) {
    return getStateOf<RatesListResponse>(
      request: () => _coinCapRemoteClient.getRatesList(),
    );
  }
}
