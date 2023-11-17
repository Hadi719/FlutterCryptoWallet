import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/responses/all_market_info_response.dart';
import '../../../domain/models/responses/all_market_list_response.dart';
import '../../../domain/models/responses/market_depth_response.dart';
import '../../../domain/models/responses/single_market_info_response.dart';
import '../../../utils/constants/strings.dart';

part 'coin_ex_api_service.g.dart';

@RestApi(baseUrl: kCoinExBaseUrl, parser: Parser.MapSerializable)
abstract class CoinExApiService {
  factory CoinExApiService(Dio dio, {String baseUrl}) = _CoinExApiService;

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
}
