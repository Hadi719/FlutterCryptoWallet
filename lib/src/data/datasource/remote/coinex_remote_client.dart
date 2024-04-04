import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../config/utils/constants/apis_strings.dart' show KCoinExStrings;
import '../../../domain/models/coinex/responses/responses.dart';

part 'coinex_remote_client.g.dart';

@RestApi(baseUrl: KCoinExStrings.baseUrl, parser: Parser.MapSerializable)
abstract class CoinExRemoteClient {
  factory CoinExRemoteClient(Dio dio, {String baseUrl}) = _CoinExRemoteClient;

  @GET(KCoinExStrings.pathAllMarketInfo)
  Future<HttpResponse<AllMarketInfoResponse>> getAllMarketInfo();

  @GET(KCoinExStrings.pathAllMarketList)
  Future<HttpResponse<AllMarketListResponse>> getAllMarketList();

  @GET(KCoinExStrings.pathAllMarketStatistics)
  Future<HttpResponse<AllMarketStatisticsResponse>> getAllMarketStatistics();

  @GET(KCoinExStrings.pathCurrencyRate)
  Future<HttpResponse<CurrencyRateResponse>> getCurrencyRate();

  @GET(KCoinExStrings.pathKLineData)
  Future<HttpResponse<KLineDataResponse>> getKLineData({
    @Query('market') required String marketName,
    @Query('limit') int? limit,
    @Query('type') required String type,
  });

  @GET(KCoinExStrings.pathLatestTransactionData)
  Future<HttpResponse<LatestTransactionDataResponse>> getLatestTransactionData({
    @Query('market') required String marketName,
    @Query('last_id') int? lastId,
    @Query('limit') int? limit,
  });

  @GET(KCoinExStrings.pathMarketDepth)
  Future<HttpResponse<MarketDepthResponse>> getMarketDepth({
    @Query('market') required String marketName,
    @Query('merge') String? merge,
    @Query('limit') int? limit,
  });

  @GET(KCoinExStrings.pathSingleMarketInfo)
  Future<HttpResponse<SingleMarketInfoResponse>> getSingleMarketInfo({
    @Query('market') required String marketName,
  });

  @GET(KCoinExStrings.pathSingleMarketStatistics)
  Future<HttpResponse<SingleMarketStatisticsResponse>>
      getSingleMarketStatistics({
    @Query('market') required String marketName,
  });
}
