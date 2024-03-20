import 'firebase_storage_response.dart';

abstract class StorageDataState<T> {
  const StorageDataState({this.data, this.storageResponse, this.error});

  final T? data;
  final StorageResponse? storageResponse;
  final Exception? error;
}

class StorageDataNotSet<T> extends StorageDataState<T> {
  const StorageDataNotSet();
}

class StorageDataSuccess<T> extends StorageDataState<T> {
  const StorageDataSuccess({super.data, super.storageResponse});
}

class StorageDataFailed<T> extends StorageDataState<T> {
  const StorageDataFailed({super.error});
}
