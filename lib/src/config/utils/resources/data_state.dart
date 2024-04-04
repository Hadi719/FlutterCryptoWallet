import 'package:dio/dio.dart' show DioException, Response;

abstract class DataState<T> {
  final T? data;
  final Response<dynamic>? response;
  final DioException? error;

  const DataState({this.data, this.response, this.error});
}

class DataNotSet<T> extends DataState<T> {
  const DataNotSet();
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({super.data, super.response});
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({super.error});
}
