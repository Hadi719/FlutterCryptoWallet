import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/coincap/responses/responses.dart';
import '../../../utils/constants/strings.dart';

part 'coincap_remote_client.g.dart';

@RestApi(baseUrl: kCoinCapBaseUrl, parser: Parser.MapSerializable)
abstract class CoinCapRemoteClient {
  factory CoinCapRemoteClient(Dio dio, {String baseUrl}) = _CoinCapRemoteClient;

  @GET(kCoinCapPathAsset)
  Future<HttpResponse<AssetResponse>> getAsset({
    @Path('id') required String id,
  });

  @GET(kCoinCapPathAssetHistory)
  Future<HttpResponse<AssetHistoriesResponse>> getAssetHistories({
    @Path('id') required String id,
    @Query('interval') required String interval,
    @Query('start') int? start,
    @Query('end') int? end,
  });

  @GET(kCoinCapPathAssetMarkets)
  Future<HttpResponse<AssetMarketsResponse>> getAssetMarkets({
    @Path('id') required String id,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET(kCoinCapPathAssetsList)
  Future<HttpResponse<AssetsListResponse>> getAssetsList({
    @Query('search') String? search,
    @Query('ids') String? ids,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET(kCoinCapPathCandlesList)
  Future<HttpResponse<CandlesListResponse>> getCandlesList({
    @Query('exchange') required String exchange,
    @Query('interval') required String interval,
    @Query('baseId') required String baseId,
    @Query('quoteId') required String quoteId,
    @Query('start') int? start,
    @Query('end') int? end,
  });

  @GET(kCoinCapPathExchange)
  Future<HttpResponse<ExchangeResponse>> getExchange({
    @Path('id') required String id,
  });

  @GET(kCoinCapPathExchangesList)
  Future<HttpResponse<ExchangesListResponse>> getExchangesList();

  @GET(kCoinCapPathMarketsList)
  Future<HttpResponse<MarketsListResponse>> getMarketsList({
    @Query('exchangeId') String? exchangeId,
    @Query('baseSymbol') String? baseSymbol,
    @Query('quoteSymbol') String? quoteSymbol,
    @Query('baseId') String? baseId,
    @Query('quoteId') String? quoteId,
    @Query('assetSymbol') String? assetSymbol,
    @Query('assetId') String? assetId,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET(kCoinCapPathRate)
  Future<HttpResponse<RateResponse>> getRate({
    @Path('id') required String id,
  });

  @GET(kCoinCapPathRatesList)
  Future<HttpResponse<RatesListResponse>> getRatesList();
}
