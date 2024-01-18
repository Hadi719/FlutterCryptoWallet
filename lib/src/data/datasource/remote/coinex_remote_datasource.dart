import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/coinex/responses/responses.dart';
import '../../../utils/constants/strings.dart';

part 'coinex_remote_datasource.g.dart';

@RestApi(baseUrl: kCoinExBaseUrl, parser: Parser.MapSerializable)
abstract class CoinExRemoteDataSource {
  factory CoinExRemoteDataSource(Dio dio, {String baseUrl}) =
      _CoinExRemoteDataSource;

  @GET(kCoinExUrlPathAllMarketList)
  Future<HttpResponse<AllMarketListResponse>> getAllMarketList();

  @GET(kCoinExUrlPathAllMarketInfo)
  Future<HttpResponse<AllMarketInfoResponse>> getAllMarketInfo();

  @GET(kCoinExUrlPathSingleMarketInfo)
  Future<HttpResponse<SingleMarketInfoResponse>> getSingleMarketInfo({
    @Query('market') required String marketName,
  });

  @GET(kCoinExUrlPathMarketDepth)
  Future<HttpResponse<MarketDepthResponse>> getMarketDepth({
    @Query('market') required String marketName,
    @Query('merge') String? merge,
    @Query('limit') int? limit,
  });

  @GET(kCoinExUrlPathLatestTransactionData)
  Future<HttpResponse<LatestTransactionDataResponse>> getLatestTransactionData({
    @Query('market') required String marketName,
    @Query('last_id') int? lastId,
    @Query('limit') int? limit,
  });

  @GET(kCoinExUrlPathKLineData)
  Future<HttpResponse<KLineDataResponse>> getKLineData({
    @Query('market') required String marketName,
    @Query('limit') int? limit,
    @Query('type') required String type,
  });

  @GET(kCoinExUrlPathSingleMarketStatistics)
  Future<HttpResponse<SingleMarketStatisticsResponse>>
      getSingleMarketStatistics({
    @Query('market') required String marketName,
  });

  @GET(kCoinExUrlPathAllMarketStatistics)
  Future<HttpResponse<AllMarketStatisticsResponse>> getAllMarketStatistics();

  @GET(kCoinExUrlPathCurrencyRate)
  Future<HttpResponse<CurrencyRateResponse>> getCurrencyRate();
}
