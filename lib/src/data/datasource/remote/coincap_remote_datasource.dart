import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/coincap/responses/responses.dart';
import '../../../utils/constants/strings.dart';

part 'coincap_remote_datasource.g.dart';

@RestApi(baseUrl: kCoinCapBaseUrl, parser: Parser.MapSerializable)
abstract class CoinCapRemoteDataSource {
  factory CoinCapRemoteDataSource(Dio dio, {String baseUrl}) =
      _CoinCapRemoteDataSource;

  @GET(kCoinCapPathAssetsList)
  Future<HttpResponse<AssetsListResponse>> getAssetsList({
    @Query('search') String? search,
    @Query('ids') String? ids,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

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
  @GET(kCoinCapPathRatesList)
  Future<HttpResponse<RatesListResponse>> getRatesList();
  @GET(kCoinCapPathRate)
  Future<HttpResponse<RateResponse>> getRate({
    @Path('id') required String id,
  });
  @GET(kCoinCapPathExchangesList)
  Future<HttpResponse<ExchangesListResponse>> getExchangesList();
  @GET(kCoinCapPathExchange)
  Future<HttpResponse<ExchangeResponse>> getExchange({
    @Path('id') required String id,
  });
  @GET(kCoinCapPathMarketsList)
  Future<HttpResponse<MarketsListResponse>> getMarketsList();
}
