import 'package:firebase_storage/firebase_storage.dart' show UploadTask;

import '../../config/utils/resources/storage_data_state.dart';
import '../../domain/models/coingecko/request/request.dart';
import '../../domain/models/coingecko/response/response.dart';
import '../../domain/repositories/firebase_storage_api_repository.dart';
import '../datasource/firebase/firebase_storage_client.dart';
import 'base/base_datasource_repository.dart';

class FirebaseStorageDatasourceRepositoryImpl extends BaseDataSourceRepository
    implements FirebaseStorageApiRepository {
  FirebaseStorageDatasourceRepositoryImpl(this._storageClient);

  final FirebaseStorageClient _storageClient;

  @override
  Future<StorageDataState<CoinHistoryResponse>> downloadCoinHistory(
      {required String id}) {
    return getStorageDownloadStateOf<CoinHistoryResponse>(
        request: () => _storageClient.downloadCoinHistory(
              id: id,
            ));
  }

  @override
  StorageDataState<List<UploadTask>> uploadCoinHistory({
    required CoinHistoryResponse response,
    required CoinHistoryRequest request,
  }) {
    return getStorageUploadStateOf(
      request: () => _storageClient.uploadCoinHistory(
        response: response,
        request: request,
      ),
    );
  }

  @override
  Future<StorageDataState<CoinsMarketsListResponse>> downloadCoinsMarketsList(
      {required CoinsMarketsListRequest request}) {
    return getStorageDownloadStateOf(
      request: () => _storageClient.downloadCoinsMarketsList(
        ids: request.ids,
      ),
    );
  }

  @override
  StorageDataState<List<UploadTask>> uploadCoinsMarketsList({
    required CoinsMarketsListResponse response,
    required CoinsMarketsListRequest request,
  }) {
    return getStorageUploadStateOf(
      request: () => _storageClient.uploadCoinsMarketsList(
        response: response,
        request: request,
      ),
    );
  }
}
