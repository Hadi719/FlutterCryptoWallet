import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/coingecko/response/response.dart';
import '../../../config/utils/constants/strings.dart';

part 'coingecko_remote_client.g.dart';

@RestApi(baseUrl: kCoinGeckoBaseUrl, parser: Parser.JsonSerializable)
abstract class CoinGeckoRemoteClient {
  factory CoinGeckoRemoteClient(Dio dio, {String baseUrl}) =
      _CoinGeckoRemoteClient;

  @GET(kCoinGeckoPathAssetPlatformsList)
  Future<HttpResponse<AssetPlatformsListResponse>> getAssetPlatformsList({
    @Query('filter') String? filter,
  });

  @GET(kCoinGeckoPathCoinHistory)
  Future<HttpResponse<CoinHistoryResponse>> getCoinHistory({
    @Path('id') required String id,
    @Query('date') required String date,
    @Query('localization') String? localization,
  });

  @GET(kCoinGeckoPathCoinMarketChart)
  Future<HttpResponse<CoinMarketChartResponse>> getCoinMarketChart({
    @Path('id') required String id,
    @Query('vs_currency') required String vsCurrency,
    @Query('days') required int days,
    @Query('interval') String? interval,
    @Query('precision') String? precision,
  });

  @GET(kCoinGeckoPathCoinMarketChartRange)
  Future<HttpResponse<CoinMarketChartRangeResponse>> getCoinMarketChartRange({
    @Path('id') required String id,
    @Query('vs_currency') required String vsCurrency,
    @Query('from') required int from,
    @Query('to') required int to,
    @Query('precision') String? precision,
  });

  @GET(kCoinGeckoPathCoinMetaData)
  Future<HttpResponse<CoinMetadataResponse>> getCoinMetadata({
    @Path('id') required String id,
    @Query('localization') String? localization,
    @Query('tickers') bool? tickers,
    @Query('market_data') bool? marketData,
    @Query('community_data') bool? communityData,
    @Query('developer_data') bool? developerData,
    @Query('sparkline') bool? sparkline,
  });

  @GET(kCoinGeckoPathCoinOHLC)
  Future<HttpResponse<CoinOHLCResponse>> getCoinOHLC({
    @Path('id') required String id,
    @Query('vs_currency') required String vsCurrency,
    @Query('days') required int days,
    @Query('precision') String? precision,
  });

  @GET(kCoinGeckoPathCoinsMarketsList)
  Future<HttpResponse<CoinsMarketsListResponse>> getCoinsMarketsList({
    @Query('vs_currency') required String vsCurrency,
    @Query('ids') String? ids,
    @Query('category') String? category,
    @Query('order') String? order,
    @Query('per_page') int? perPage,
    @Query('page') int? page,
    @Query('sparkline') String? sparkline,
    @Query('price_change_percentage') String? priceChangePercentage,
    @Query('locale') String? locale,
    @Query('precision') String? precision,
  });

  @GET(kCoinGeckoPathExchangeRates)
  Future<HttpResponse<ExchangeRatesResponse>> getExchangeRates();

  @GET(kCoinGeckoPathSimplePricesList)
  Future<HttpResponse<SimplePricesListResponse>> getSimplePricesList({
    @Query('ids') required String ids,
    @Query('vs_currencies') required String vsCurrencies,
    @Query('include_market_cap') bool? includeMarketCap,
    @Query('include_24hr_vol') bool? include24hrVol,
    @Query('include_24hr_change') bool? include24hrChange,
    @Query('include_last_updated_at') bool? includeLastUpdatedAt,
    @Query('precision') int? precision,
  });

  @GET(kCoinGeckoPathSimpleSupportedVsCurrencies)
  Future<HttpResponse<SimpleSupportedVsCurrenciesResponse>>
      getSimpleSupportedVsCurrencies();
}
