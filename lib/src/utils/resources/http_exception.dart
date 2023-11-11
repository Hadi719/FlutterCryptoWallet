import 'package:http/http.dart' as http;

class HttpException implements Exception {
  HttpException({
    required this.request,
    this.response,
    this.error,
    this.stackTrace,
    this.message,
  });
  final http.Request request;
  final http.Response? response;
  final Object? error;
  final StackTrace? stackTrace;
  final String? message;

  HttpException copyWith({
    http.Request? request,
    http.Response? response,
    Object? error,
    StackTrace? stackTrace,
    String? message,
  }) {
    return HttpException(
      request: request ?? this.request,
      response: response ?? this.response,
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    String msg = '=======>  HttpException: $message';
    if (error != null) {
      msg += '\nError: $error';
    }
    if (response != null) {
      msg += '\nStatus Code: ${response?.statusCode}';
    }

    msg += '\nRequest: ${request.toString()}';
    msg += '\n<=======';

    return msg;
  }
}
