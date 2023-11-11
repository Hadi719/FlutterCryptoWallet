import 'http_error.dart';

abstract class DataState<T> {
  final T? data;
  final HttpError? httpError;

  const DataState({this.data, this.httpError});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(HttpError error) : super(httpError: error);
}

class DataNotSet<T> extends DataState<T> {
  const DataNotSet();
}
