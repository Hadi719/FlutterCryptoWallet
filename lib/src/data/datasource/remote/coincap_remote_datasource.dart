import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/coincap/responses/responses.dart';
import '../../../utils/constants/strings.dart';

part 'coincap_remote_datasource.g.dart';

@RestApi(baseUrl: kCoinCapBaseUrl, parser: Parser.MapSerializable)
abstract class CoinCapRemoteDataSource {
  factory CoinCapRemoteDataSource(Dio dio, {String baseUrl}) =
      _CoinCapRemoteDataSource;

  @GET(kCoinCapPathAssets)
  Future<HttpResponse<AssetsResponse>> getAssets();

/*

  @GET(kCoinExUrlKLineData)
  Future<HttpResponse<KLineDataResponse>> getKLineData({
    @Query('market') required String marketName,
    @Query('limit') int? limit,
    @Query('type') required String type,
  });
*/
}
