import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageResponse<T> {
  final T data;
  final StorageResponse storageResponse;

  FirebaseStorageResponse(this.data, this.storageResponse);
}

class StorageResponse {
  StorageResponse({
    this.jsonData,
    this.utf8Data,
    this.fullMetadata,
  });

  /// Converted data from [Uint8List]
  ///
  /// Example: Using one of these to convert.
  /// ```dart
  /// String data1 = String.fromCharCodes(rawData.toList());
  /// String data2 = utf8.decode(rawData.toList());
  /// ```
  Map<String, dynamic>? jsonData;

  /// The response payload in [Uint8List] using [Reference.getData()]
  ///
  /// Example:
  /// ```dart
  /// Uint8List data = utf8.encode(jsonData);
  /// ```
  Uint8List? utf8Data;

  FullMetadata? fullMetadata;

  /// The request that send to api to get this response
  ///
  /// This request stored in customMetadata as request.
  ///
  /// can get this with:
  /// ```dart
  /// metadata.customMetadata?['request'];
  /// ```
  Map<String, dynamic>? get request {
    String? request = fullMetadata?.customMetadata?['request'];
    if (request == null) return null;
    return jsonDecode(request);
  }
}
