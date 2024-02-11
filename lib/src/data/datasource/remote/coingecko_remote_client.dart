import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/coingecko/response/response.dart';
import '../../../utils/constants/strings.dart';

part 'coingecko_remote_client.g.dart';

@RestApi(baseUrl: kCoinGeckoBaseUrl, parser: Parser.JsonSerializable)
abstract class CoinGeckoRemoteClient {
  factory CoinGeckoRemoteClient(Dio dio, {String baseUrl}) =
      _CoinGeckoRemoteClient;

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

  @GET(kCoinGeckoPathCoinHistory)
  Future<HttpResponse<CoinHistoryResponse>> getCoinHistory({
    @Path('id') required String id,
    @Query('date') required String date,
    @Query('localization') String? localization,
  });
}