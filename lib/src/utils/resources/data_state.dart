import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final Response<dynamic>? response;
  final DioException? error;

  const DataState({this.data, this.response, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({super.data, super.response});
  // : super(data: data, response: response);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({super.error});
  // : super(error: error);
}

class DataNotSet<T> extends DataState<T> {
  const DataNotSet();
}
