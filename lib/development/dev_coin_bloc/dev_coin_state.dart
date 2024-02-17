part of 'dev_coin_bloc.dart';

enum CoinApi { coinEx, coinCap, coinGecko }

final class DevCoinState extends Equatable {
  final DevCoinStatus status;

  final CoinApi coinApi;
  final DevCoinEvent? lastEvent;
  final Object? error;

  final dynamic data;

  const DevCoinState({
    this.status = DevCoinStatus.initial,
    this.coinApi = CoinApi.coinGecko,
    this.lastEvent,
    this.error,
    this.data = const [],
  });

  @override
  List<Object?> get props => [status, coinApi, lastEvent, error, data];

  DevCoinState copyWith({
    DevCoinStatus? status,
    CoinApi? coinApi,
    DevCoinEvent? lastEvent,
    Object? error,
    dynamic data,
  }) {
    return DevCoinState(
      status: status ?? this.status,
      coinApi: coinApi ?? this.coinApi,
      lastEvent: lastEvent ?? this.lastEvent,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return '''TestCeState { status: $status, coinApi: $coinApi, lastEvent: $lastEvent \nerror: ${error.toString()}\ndata: ${data.toString()} }''';
  }
}

enum DevCoinStatus { initial, success, loading, failure }
