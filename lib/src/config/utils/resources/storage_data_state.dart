import 'package:firebase_storage/firebase_storage.dart' show UploadTask;

import 'firebase_storage_response.dart';

abstract class StorageDataState<T> {
  const StorageDataState({
    this.data,
    this.storageResponse,
    this.uploadTasks,
    this.error,
  });

  final T? data;
  final StorageResponse? storageResponse;
  final List<UploadTask>? uploadTasks;
  final Exception? error;
}

class StorageDataNotSet<T> extends StorageDataState<T> {
  const StorageDataNotSet();
}

class StorageDataDownloadSuccess<T> extends StorageDataState<T> {
  const StorageDataDownloadSuccess({super.data, super.storageResponse});
}

class StorageDataUploadTasks<T> extends StorageDataState<T> {
  const StorageDataUploadTasks({super.uploadTasks});
}

class StorageDataFailed<T> extends StorageDataState<T> {
  const StorageDataFailed({super.error});
}
