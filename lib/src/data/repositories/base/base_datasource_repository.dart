import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart' show DioException;
import 'package:firebase_storage/firebase_storage.dart' show UploadTask;
import 'package:meta/meta.dart' show protected;
import 'package:retrofit/retrofit.dart' show HttpResponse;

import '../../../config/utils/resources/data_state.dart';
import '../../../config/utils/resources/firebase_storage_response.dart';
import '../../../config/utils/resources/storage_data_state.dart';

abstract class BaseDataSourceRepository {
  /// This method is responsible of handling the given `request`, in which
  /// it returns generic based `DataState`.
  ///
  /// Returns `DataSuccess` that holds the generic data `T` if the response
  /// is successfully received.
  ///
  /// Returns `DataFailed` that holds a `DioError` instance if any error occurs
  /// while sending the request or receiving the response.
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final HttpResponse<T> httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: httpResponse.data,
          response: httpResponse.response,
        );
      } else {
        throw DioException(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioException catch (error) {
      return DataFailed(error: error);
    }
  }

  @protected
  Future<StorageDataState<T>> getStorageDownloadStateOf<T>({
    required Future<FirebaseStorageResponse<T>> Function() request,
  }) async {
    try {
      final FirebaseStorageResponse<T> response = await request();
      return StorageDataDownloadSuccess(
        data: response.data,
        storageResponse: response.storageResponse,
      );
    } catch (error) {
      if (error is Exception) {
        return StorageDataFailed(error: error);
      } else {
        return StorageDataFailed(error: Exception(error));
      }
    }
  }

  @protected
  StorageDataState<List<UploadTask>> getStorageUploadStateOf<T>({
    required List<UploadTask> Function() request,
  }) {
    try {
      final List<UploadTask> uploadTasks = request();
      return StorageDataUploadTasks(uploadTasks: uploadTasks);
    } catch (error) {
      if (error is Exception) {
        return StorageDataFailed(error: error);
      } else {
        return StorageDataFailed(error: Exception(error));
      }
    }
  }
}
