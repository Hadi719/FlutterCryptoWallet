import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../config/utils/constants/apis_strings.dart' show KCoinCapStrings;
import '../../../domain/models/coincap/responses/responses.dart';

part 'coincap_remote_client.g.dart';

@RestApi(baseUrl: KCoinCapStrings.baseUrl, parser: Parser.MapSerializable)
abstract class CoinCapRemoteClient {
  factory CoinCapRemoteClient(Dio dio, {String baseUrl}) = _CoinCapRemoteClient;

  @GET(KCoinCapStrings.pathAsset)
  Future<HttpResponse<AssetResponse>> getAsset({
    @Path('id') required String id,
  });

  @GET(KCoinCapStrings.pathAssetHistory)
  Future<HttpResponse<AssetHistoriesResponse>> getAssetHistories({
    @Path('id') required String id,
    @Query('interval') required String interval,
    @Query('start') int? start,
    @Query('end') int? end,
  });

  @GET(KCoinCapStrings.pathAssetMarkets)
  Future<HttpResponse<AssetMarketsResponse>> getAssetMarkets({
    @Path('id') required String id,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET(KCoinCapStrings.pathAssetsList)
  Future<HttpResponse<AssetsListResponse>> getAssetsList({
    @Query('search') String? search,
    @Query('ids') String? ids,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET(KCoinCapStrings.pathCandlesList)
  Future<HttpResponse<CandlesListResponse>> getCandlesList({
    @Query('exchange') required String exchange,
    @Query('interval') required String interval,
    @Query('baseId') required String baseId,
    @Query('quoteId') required String quoteId,
    @Query('start') int? start,
    @Query('end') int? end,
  });

  @GET(KCoinCapStrings.pathExchange)
  Future<HttpResponse<ExchangeResponse>> getExchange({
    @Path('id') required String id,
  });

  @GET(KCoinCapStrings.pathExchangesList)
  Future<HttpResponse<ExchangesListResponse>> getExchangesList();

  @GET(KCoinCapStrings.pathMarketsList)
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

  @GET(KCoinCapStrings.pathRate)
  Future<HttpResponse<RateResponse>> getRate({
    @Path('id') required String id,
  });

  @GET(KCoinCapStrings.pathRatesList)
  Future<HttpResponse<RatesListResponse>> getRatesList();
}
