import '../../domain/models/coincap/requests/requests.dart';
import '../../domain/models/coincap/responses/responses.dart';
import '../../domain/repositories/coincap_api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../datasource/remote/coincap_remote_datasource.dart';
import 'base/base_datasource_repository.dart';

class CoinCapDataSourceRepositoryImpl extends BaseDataSourceRepository
    implements CoinCapApiRepository {
  final CoinCapRemoteDataSource _coinCapRemoteDataSource;

  CoinCapDataSourceRepositoryImpl(this._coinCapRemoteDataSource);

  @override
  Future<DataState<AssetsResponse>> getAssets({
    required AssetsRequest request,
  }) {
    return getStateOf<AssetsResponse>(
      request: () => _coinCapRemoteDataSource.getAssets(),
    );
  }

/*
  @override
  Future<DataState<KLineDataResponse>> getKLineData(
      {required KLineDataRequest request}) {
    return getStateOf<KLineDataResponse>(
        request: () => _coinExRemoteDataSource.getKLineData(
          marketName: request.marketName,
          limit: request.limit,
          type: request.type.value,
        ));
  }
*/
}
