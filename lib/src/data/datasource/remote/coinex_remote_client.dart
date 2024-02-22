import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/coinex/responses/responses.dart';
import '../../../config/utils/constants/strings.dart';

part 'coinex_remote_client.g.dart';

@RestApi(baseUrl: kCoinExBaseUrl, parser: Parser.MapSerializable)
abstract class CoinExRemoteClient {
  factory CoinExRemoteClient(Dio dio, {String baseUrl}) = _CoinExRemoteClient;

  @GET(kCoinExPathAllMarketInfo)
  Future<HttpResponse<AllMarketInfoResponse>> getAllMarketInfo();

  @GET(kCoinExPathAllMarketList)
  Future<HttpResponse<AllMarketListResponse>> getAllMarketList();

  @GET(kCoinExPathAllMarketStatistics)
  Future<HttpResponse<AllMarketStatisticsResponse>> getAllMarketStatistics();

  @GET(kCoinExPathCurrencyRate)
  Future<HttpResponse<CurrencyRateResponse>> getCurrencyRate();

  @GET(kCoinExPathKLineData)
  Future<HttpResponse<KLineDataResponse>> getKLineData({
    @Query('market') required String marketName,
    @Query('limit') int? limit,
    @Query('type') required String type,
  });

  @GET(kCoinExPathLatestTransactionData)
  Future<HttpResponse<LatestTransactionDataResponse>> getLatestTransactionData({
    @Query('market') required String marketName,
    @Query('last_id') int? lastId,
    @Query('limit') int? limit,
  });

  @GET(kCoinExPathMarketDepth)
  Future<HttpResponse<MarketDepthResponse>> getMarketDepth({
    @Query('market') required String marketName,
    @Query('merge') String? merge,
    @Query('limit') int? limit,
  });

  @GET(kCoinExPathSingleMarketInfo)
  Future<HttpResponse<SingleMarketInfoResponse>> getSingleMarketInfo({
    @Query('market') required String marketName,
  });

  @GET(kCoinExPathSingleMarketStatistics)
  Future<HttpResponse<SingleMarketStatisticsResponse>>
      getSingleMarketStatistics({
    @Query('market') required String marketName,
  });
}
