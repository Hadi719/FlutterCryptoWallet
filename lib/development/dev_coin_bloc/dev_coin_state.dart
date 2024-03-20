part of 'dev_coin_bloc.dart';

enum CoinApi { coinEx, coinCap, coinGecko, firebaseStorage }

final class DevCoinState extends Equatable {
  final DevCoinStatus status;

  final CoinApi coinApi;
  final DevCoinEvent? lastEvent;
  final Object? error;
  final dynamic data;
  final String subtitle;

  const DevCoinState({
    this.status = DevCoinStatus.initial,
    this.coinApi = CoinApi.firebaseStorage,
    this.lastEvent,
    this.error,
    this.data = const [],
    this.subtitle = '---',
  });

  @override
  List<Object?> get props => [
        status,
        coinApi,
        lastEvent,
        error,
        data,
        subtitle,
      ];

  DevCoinState copyWith({
    DevCoinStatus? status,
    CoinApi? coinApi,
    DevCoinEvent? lastEvent,
    Object? error,
    dynamic data,
    String? subtitle,
  }) {
    return DevCoinState(
      status: status ?? this.status,
      coinApi: coinApi ?? this.coinApi,
      lastEvent: lastEvent ?? this.lastEvent,
      error: error ?? this.error,
      data: data ?? this.data,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  @override
  String toString() {
    return '''TestCeState { status: $status, coinApi: $coinApi, lastEvent: $lastEvent \nerror: ${error.toString()}\ndata: ${data.toString()} }''';
  }
}

enum DevCoinStatus { initial, success, loading, failure }
