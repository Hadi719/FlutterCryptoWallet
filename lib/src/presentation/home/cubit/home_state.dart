part of 'home_cubit.dart';

final class HomeState extends Equatable {
  final HomeStatus status;

  final AllMarketStatisticsResponse? allMarketStatisticsResponse;

  /// Probably [DioException]
  final Object? error;

  const HomeState({
    this.status = HomeStatus.initial,
    this.allMarketStatisticsResponse,
    this.error,
  });

  @override
  List<Object?> get props => [status, allMarketStatisticsResponse];

  @override
  bool get stringify => true;

  HomeState copyWith({
    HomeStatus? status,
    AllMarketStatisticsResponse? allMarketStatisticsResponse,
    Object? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      allMarketStatisticsResponse:
          allMarketStatisticsResponse ?? this.allMarketStatisticsResponse,
      error: error ?? this.error,
    );
  }
}

enum HomeStatus { initial, loading, success, failure }
