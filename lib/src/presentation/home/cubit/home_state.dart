part of 'home_cubit.dart';

final class HomeState extends Equatable {
  final HomeStatus status;

  /// Probably [DioException]
  final Object? error;

  final List<CoinMarketData>? coins;

  const HomeState({
    this.status = HomeStatus.initial,
    this.error,
    this.coins,
  });

  @override
  List<Object?> get props => [status, error, coins];

  @override
  bool get stringify => true;

  HomeState copyWith({
    HomeStatus? status,
    Object? error,
    List<CoinMarketData>? coins,
  }) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      coins: coins ?? this.coins,
    );
  }
}

enum HomeStatus { initial, loading, success, failure }
