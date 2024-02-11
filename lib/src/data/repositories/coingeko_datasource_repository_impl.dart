import '../../domain/models/coingecko/request/request.dart';
import '../../domain/models/coingecko/response/response.dart';
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

  @override
  Future<DataState<SimpleSupportedVsCurrenciesResponse>>
      getSimpleSupportedVsCurrencies(
          {required SimpleSupportedVsCurrenciesRequest request}) {
    return getStateOf<SimpleSupportedVsCurrenciesResponse>(
        request: () => _coinGeckoRemoteClient.getSimpleSupportedVsCurrencies());
  }

  @override
  Future<DataState<CoinMetadataResponse>> getCoinMetadata(
      {required CoinMetadataRequest request}) {
    return getStateOf<CoinMetadataResponse>(
        request: () => _coinGeckoRemoteClient.getCoinMetadata(
              id: request.id,
              localization: request.localization,
              tickers: request.tickers,
              marketData: request.marketData,
              communityData: request.communityData,
              developerData: request.developerData,
              sparkline: request.sparkline,
            ));
  }

  @override
  Future<DataState<CoinHistoryResponse>> getCoinHistory(
      {required CoinHistoryRequest request}) {
    return getStateOf<CoinHistoryResponse>(
        request: () => _coinGeckoRemoteClient.getCoinHistory(
              id: request.id,
              date: request.date,
              localization: request.localization,
            ));
  }

  @override
  Future<DataState<CoinsMarketsListResponse>> getCoinsMarketsList(
      {required CoinsMarketsListRequest request}) {
    return getStateOf<CoinsMarketsListResponse>(
        request: () => _coinGeckoRemoteClient.getCoinsMarketsList(
              vsCurrency: request.vsCurrency,
              ids: request.ids,
              category: request.category,
              order: request.order?.value,
              perPage: request.perPage,
              page: request.page,
              sparkline: request.sparkline,
              priceChangePercentage: request.priceChangePercentage,
              locale: request.locale?.name,
              precision: request.precision,
            ));
  }

  @override
  Future<DataState<CoinMarketChartResponse>> getCoinMarketChart(
      {required CoinMarketChartRequest request}) {
    return getStateOf<CoinMarketChartResponse>(
        request: () => _coinGeckoRemoteClient.getCoinMarketChart(
              id: request.id,
              vsCurrency: request.vsCurrency,
              days: request.days,
              interval: request.interval,
              precision: request.precision,
            ));
  }
}
