import 'package:firebase_storage/firebase_storage.dart' show UploadTask;

import '../../config/utils/resources/storage_data_state.dart';
import '../models/coingecko/request/request.dart';
import '../models/coingecko/response/response.dart';

abstract class FirebaseStorageApiRepository {
  Future<StorageDataState<CoinHistoryResponse>> downloadCoinHistory({
    required String id,
  });

  StorageDataState<List<UploadTask>> uploadCoinHistory({
    required CoinHistoryResponse response,
    required CoinHistoryRequest request,
  });

  Future<StorageDataState<CoinsMarketsListResponse>> downloadCoinsMarketsList({
    required CoinsMarketsListRequest request,
  });

  StorageDataState<List<UploadTask>> uploadCoinsMarketsList({
    required CoinsMarketsListResponse response,
    required CoinsMarketsListRequest request,
  });
}
