part of 'dev_coin_bloc.dart';

enum CoinApi { coinEx, coinCap, coinGecko, firebaseStorage }

final class DevCoinState extends Equatable {
  final DevCoinStatus status;

  final CoinApi coinApi;
  final DevCoinEvent? lastEvent;
  final Object? error;
  final dynamic data;
  final String? downloadLink;

  const DevCoinState({
    this.status = DevCoinStatus.initial,
    this.coinApi = CoinApi.firebaseStorage,
    this.lastEvent,
    this.error,
    this.data = const [],
    this.downloadLink,
  });

  @override
  List<Object?> get props => [
        status,
        coinApi,
        lastEvent,
        error,
        data,
        downloadLink,
      ];

  DevCoinState copyWith({
    DevCoinStatus? status,
    CoinApi? coinApi,
    DevCoinEvent? lastEvent,
    Object? error,
    dynamic data,
    String? downloadLink,
  }) {
    return DevCoinState(
      status: status ?? this.status,
      coinApi: coinApi ?? this.coinApi,
      lastEvent: lastEvent ?? this.lastEvent,
      error: error ?? this.error,
      data: data ?? this.data,
      downloadLink: downloadLink ?? this.downloadLink,
    );
  }

  @override
  String toString() {
    return '''TestCeState { status: $status, coinApi: $coinApi, lastEvent: $lastEvent \nerror: ${error.toString()}\ndata: ${data.toString()} }''';
  }
}

enum DevCoinStatus { initial, success, loading, failure }
