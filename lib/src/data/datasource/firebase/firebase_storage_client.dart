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

  Future<FirebaseStorageResponse<CoinHistoryResponse>> downloadCoinHistory({
    required String id,
  }) async {
    final storageResponse = await _downloadData(
      fullFilePath: '$kStoragePathGeckoHistory/$id',
    );

    final value = CoinHistoryResponse.fromJson(storageResponse.jsonData!);
    final firebaseStorageResponse =
        FirebaseStorageResponse(value, storageResponse);

    return firebaseStorageResponse;
  }

  UploadTask uploadCoinHistory({
    required CoinHistoryResponse response,
    required CoinHistoryRequest request,
  }) {
    UploadTask uploadTask = _uploadData(
      fullFilePath: '$kStoragePathGeckoHistory/${request.id}',
      data: response.toJson(),
      request: request.toJson(),
    );
    return uploadTask;
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
    required Map<String, dynamic> request,
  }) {
    UploadTask uploadTask;

    String jsonData = jsonEncode(data);

    SettableMetadata metadata = SettableMetadata(
      contentLanguage: 'en',
      contentType: 'gecko/json',
      customMetadata: {'request': jsonEncode(request)},
    );

    Uint8List uint8ListData = utf8.encode(jsonData);
    uploadTask = _storage.ref().child(fullFilePath).putData(
          uint8ListData,
          metadata,
        );

    return uploadTask;
  }

  /// Todo: Delete this
  Future<TaskSnapshot> putTest({
    required Map<String, dynamic> data,
    CoinHistoryRequest? request,
    SettableMetadata? metadata,
  }) async {
    TaskSnapshot snapshot;
    CoinHistoryRequest defaultRequest = const CoinHistoryRequest(
      id: 'bitcoin',
      date: '30-12-2022',
    );
    final SettableMetadata defaultMetadata = SettableMetadata(
      contentLanguage: 'en',
      contentType: 'application/json',
      customMetadata: {'request': defaultRequest.toJson().toString()},
    );
    final jsonData = jsonEncode(data);

    snapshot = await _storage
        .ref()
        .child('$kStoragePathGeckoHistory/${request?.id}.json')
        .putString(
          jsonData,
          metadata: metadata ?? defaultMetadata,
        );

    return Future.value(snapshot);
  }

  /// Todo: Delete this
  Future<CoinHistoryResponse> getTest({
    required String id,
  }) async {
    Uint8List? data = await _storage
        .ref()
        .child('$kStoragePathGeckoHistory/$id.json')
        .getData();
    String dataString = String.fromCharCodes(data!.toList());
    var dataJson = jsonDecode(dataString);

    return CoinHistoryResponse.fromJson(dataJson);
  }
}
