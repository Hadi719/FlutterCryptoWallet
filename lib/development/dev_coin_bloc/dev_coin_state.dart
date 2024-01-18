part of 'dev_coin_bloc.dart';

enum DevCoinStatus { initial, success, loading, failure }

enum CoinApi { coinEx, coinCap }

final class DevCoinState extends Equatable {
  const DevCoinState({
    this.status = DevCoinStatus.initial,
    this.coinApi = CoinApi.coinCap,
    this.lastEvent,
    this.data = const [],
  });

  final DevCoinStatus status;
  final CoinApi coinApi;
  final DevCoinEvent? lastEvent;
  final dynamic data;

  DevCoinState copyWith({
    DevCoinStatus? status,
    CoinApi? coinApi,
    DevCoinEvent? lastEvent,
    dynamic data,
  }) {
    return DevCoinState(
      status: status ?? this.status,
      coinApi: coinApi ?? this.coinApi,
      lastEvent: lastEvent ?? this.lastEvent,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, coinApi, lastEvent, data];

  @override
  String toString() {
    return '''TestCeState { status: $status, coinApi: $coinApi ,lastEvent: $lastEvent \ndata: ${data.toString()} }''';
  }
}
