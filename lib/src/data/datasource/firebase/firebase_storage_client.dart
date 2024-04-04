import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import '../../../config/utils/constants/firebase_strings.dart';
import '../../../config/utils/resources/firebase_storage_response.dart';
import '../../../domain/models/coingecko/request/request.dart';
import '../../../domain/models/coingecko/response/response.dart';

class FirebaseStorageClient {
  const FirebaseStorageClient(this._storage);

  final FirebaseStorage _storage;

  /// Downloading [CoinHistoryResponse] base on _[id]_
  Future<FirebaseStorageResponse<CoinHistoryResponse>> downloadCoinHistory({
    required String id,
  }) async {
    final storageResponse = await _downloadData(
      fullFilePath: '$kStoragePathGeckoHistory/$id.json',
    );

    final value = CoinHistoryResponse.fromJson(storageResponse.jsonData!);
    final firebaseStorageResponse =
        FirebaseStorageResponse(value, storageResponse);

    return firebaseStorageResponse;
  }

  /// Uploading [CoinHistoryResponse]
  List<UploadTask> uploadCoinHistory({
    required CoinHistoryResponse response,
    required CoinHistoryRequest request,
  }) {
    UploadTask uploadTask = _uploadData(
      fullFilePath: '$kStoragePathGeckoHistory/${request.id}.json',
      data: response.toJson(),
      request: request.toJson(),
    );
    return [uploadTask];
  }

  List<UploadTask> uploadCoinsMarketsList({
    required CoinsMarketsListResponse response,
    required CoinsMarketsListRequest request,
  }) {
    if (response.data == null) {
      throw const FormatException('CoinsMarketsListResponse data is null');
    }

    List<UploadTask> uploadTasks = [];

    UploadTask uploadResponseTask = _uploadData(
      fullFilePath: '$kStoragePathGeckoMarketsList/response.json',
      data: response.toJson(),
      request: request.toJson(),
    );

    uploadTasks.add(uploadResponseTask);

    for (CoinMarketData cmd in response.data!) {
      /// Todo: Log the [CoinMarketData] with null id;
      if (cmd.id == null) continue;

      UploadTask uploadCMDTask = _uploadData(
        fullFilePath: '$kStoragePathGeckoMarketsList/${cmd.id}.json',
        data: cmd.toJson(),
      );

      uploadTasks.add(uploadCMDTask);
    }

    return uploadTasks;
  }

  Future<FirebaseStorageResponse<CoinsMarketsListResponse>>
      downloadCoinsMarketsList({
    required String? ids,
  }) async {
    StorageResponse storageResponse = await _downloadData(
      fullFilePath: '$kStoragePathGeckoMarketsList/response.json',
    );

    CoinsMarketsListResponse result;

    // Download requested [CoinMarketData] ids.
    if (ids != null) {
      List<CoinMarketData> cmds = [];
      final List<String> splitIds = ids.split(',');
      for (int i = 0; i < splitIds.length; i++) {
        StorageResponse sr = await _downloadData(
          fullFilePath:
              '$kStoragePathGeckoMarketsList/${splitIds[i].trim()}.json',
        );

        cmds.add(CoinMarketData.fromJson(sr.jsonData!));
      }

      result = CoinsMarketsListResponse(data: cmds);
    } else {
      // Download latest [CoinsMarketsListResponse]
      result = CoinsMarketsListResponse.fromJson(
        storageResponse.jsonData!,
      );
    }

    final FirebaseStorageResponse<CoinsMarketsListResponse>
        firebaseStorageResponse = FirebaseStorageResponse(
      result,
      storageResponse,
    );

    return firebaseStorageResponse;
  }

  Future<ListResult> _downloadList({
    required String fullListPath,
    int maxResults = 10,
  }) async {
    Reference ref = _storage.ref().child(fullListPath);
    ListResult listResults = await ref.list(
      ListOptions(maxResults: maxResults),
    );

    return listResults;
  }

  Future<StorageResponse> _downloadData({
    required String fullFilePath,
  }) async {
    Reference ref = _storage.ref().child(fullFilePath);
    FullMetadata metadata = await ref.getMetadata();
    Uint8List? rawData = await ref.getData();
    if (rawData == null) {
      throw FormatException(
        'Firebase storage response data is null\n'
        'Full Path: $fullFilePath\n'
        'Reference:\n${ref.toString()}\n'
        'metadata: ${metadata.toString()}',
      );
    }

    // String stringData = String.fromCharCodes(rawData.toList());
    String stringData = utf8.decode(rawData.toList());
    Map<String, dynamic> jsonData = jsonDecode(stringData);

    return StorageResponse(
      jsonData: jsonData,
      utf8Data: rawData,
      fullMetadata: metadata,
    );
  }

  UploadTask _uploadData({
    required String fullFilePath,
    required Map<String, dynamic> data,
    Map<String, dynamic>? request,
    Map<String, String>? customMetadata,
  }) {
    UploadTask uploadTask;

    String jsonData = jsonEncode(data);

    Map<String, String>? fullCustomMetadata = {};

    if (request != null) {
      fullCustomMetadata.addAll({'request': jsonEncode(request)});
    }

    if (customMetadata != null) {
      fullCustomMetadata.addAll(customMetadata);
    }

    SettableMetadata metadata = SettableMetadata(
      contentLanguage: 'en',
      contentType: 'application/json',
      customMetadata: fullCustomMetadata,
    );

    Uint8List uint8ListData = utf8.encode(jsonData);
    uploadTask = _storage.ref().child(fullFilePath).putData(
          uint8ListData,
          metadata,
        );

    return uploadTask;
  }
}
