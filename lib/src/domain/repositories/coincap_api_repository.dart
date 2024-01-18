import '../../utils/resources/data_state.dart';
import '../models/coincap/requests/requests.dart';
import '../models/coincap/responses/responses.dart';

abstract class CoinCapApiRepository {
  Future<DataState<AssetsListResponse>> getAssetsList({
    required AssetsListRequest request,
  });

/*
  Future<DataState<KLineDataResponse>> getKLineData({
    required KLineDataRequest request,
  });
*/
}
