import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/coingecko/response/response.dart';
import '../../../utils/constants/strings.dart';

part 'coingecko_remote_client.g.dart';

@RestApi(baseUrl: kCoinGeckoBaseUrl, parser: Parser.MapSerializable)
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

/*  @GET(kCoinCapPathAssetHistory)
  Future<HttpResponse<AssetHistoriesResponse>> getAssetHistories({
    @Path('id') required String id,
    @Query('interval') required String interval,
    @Query('start') int? start,
    @Query('end') int? end,
  });*/
}
