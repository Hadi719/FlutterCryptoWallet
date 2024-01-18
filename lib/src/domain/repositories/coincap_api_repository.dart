import '../../utils/resources/data_state.dart';
import '../models/coincap/requests/requests.dart';
import '../models/coincap/responses/responses.dart';

abstract class CoinCapApiRepository {
  Future<DataState<AssetsResponse>> getAssets({
    required AssetsRequest request,
  });

/*
  Future<DataState<KLineDataResponse>> getKLineData({
    required KLineDataRequest request,
  });
*/
}
