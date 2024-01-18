part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

final class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.allMarketStatisticsResponse,
    this.error,
  });

  final HomeStatus status;
  final AllMarketStatisticsResponse? allMarketStatisticsResponse;

  /// Probably [DioException]
  final Object? error;

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

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, allMarketStatisticsResponse];
}
